import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:q_bank/core/core.dart';

/// An interceptor that will try to send failed request again
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final RetryOptions options;
  final bool shouldLog;
  final Future<String?> Function()? refreshTokenCallback;

  RetryInterceptor({
    required this.dio,
    RetryOptions? options,
    this.shouldLog = true,
    this.refreshTokenCallback,
  }) : options = options ?? const RetryOptions();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var extra = RetryOptions.fromExtra(err.requestOptions, options);

    // Handle token refresh on 401
    if (err.response?.statusCode == 401 && refreshTokenCallback != null) {
      final newToken = await TokenRefreshSynchronizer.refreshToken(
        refreshTokenCallback!,
      );

      if (newToken != null && newToken.isNotEmpty) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      } else {
        return super.onError(err, handler);
      }
    }

    final shouldRetry = extra.retries > 0 && await options.retryEvaluator(err);

    if (!shouldRetry) {
      return super.onError(err, handler);
    }

    if (extra.retryInterval.inMilliseconds > 0) {
      await Future.delayed(extra.retryInterval);
    }

    extra = extra.copyWith(retries: extra.retries - 1);
    err.requestOptions.extra = err.requestOptions.extra
      ..addAll(extra.toExtra());

    if (shouldLog) {
      log(
        '[${err.requestOptions.uri}] Retrying request (remaining: ${extra.retries}, error: ${err.message})',
      );
    }

    try {
      dynamic newData = err.requestOptions.data;

      if (err.requestOptions.hasFiles) {
        final originalBody = err.requestOptions.originalBody;
        final files = err.requestOptions.files;
        final formData = FormData.fromMap(originalBody ?? {});
        for (var entry in files!.entries) {
          formData.files.add(
            MapEntry(entry.key, await MultipartFile.fromFile(entry.value.path)),
          );
        }
        newData = formData;
      }

      // if (hasFiles &&
      //     originalBody is Map<String, dynamic> &&
      //     files is Map<String, File>) {

      // }

      final response = await dio.request(
        err.requestOptions.path,
        cancelToken: err.requestOptions.cancelToken,
        data: newData,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        onSendProgress: err.requestOptions.onSendProgress,
        queryParameters: err.requestOptions.queryParameters,
        options: err.requestOptions.toOptions(),
      );

      handler.resolve(response);
    } catch (e) {
      handler.reject(
        e is DioException
            ? e
            : DioException(requestOptions: err.requestOptions, error: e),
      );
    }
  }
}

typedef RetryEvaluator = FutureOr<bool> Function(DioException error);

extension RequestOptionsExtensions on RequestOptions {
  Options toOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}

class RetryOptions {
  /// The number of retry in case of an error
  final int retries;

  /// The interval before a retry.
  final Duration retryInterval;

  /// Evaluating if a retry is necessary.regarding the error.
  ///
  /// It can be a good candidate for additional operations too, like
  /// updating authentication token in case of a unauthorized error (be careful
  /// with concurrency though).
  ///
  /// Defaults to [defaultRetryEvaluator].
  RetryEvaluator get retryEvaluator => _retryEvaluator ?? defaultRetryEvaluator;

  final RetryEvaluator? _retryEvaluator;

  const RetryOptions({
    this.retries = 3,
    RetryEvaluator? retryEvaluator,
    this.retryInterval = const Duration(seconds: 1),
  }) : _retryEvaluator = retryEvaluator;

  factory RetryOptions.noRetry() {
    return const RetryOptions(retries: 0);
  }

  static const extraKey = 'cache_retry_request';

  /// Returns [true] only if the response hasn't been cancelled or got
  /// a bad status code.
  static FutureOr<bool> defaultRetryEvaluator(DioException error) {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      return true;
    }
    final cancelError = error.type != DioExceptionType.cancel;
    final responseError = error.type != DioExceptionType.badResponse;
    final shouldRetry = cancelError && responseError;
    return shouldRetry;
  }

  factory RetryOptions.fromExtra(
    RequestOptions request,
    RetryOptions defaultOptions,
  ) {
    return request.extra[extraKey] ?? defaultOptions;
  }

  RetryOptions copyWith({int? retries, Duration? retryInterval}) =>
      RetryOptions(
        retries: retries ?? this.retries,
        retryInterval: retryInterval ?? this.retryInterval,
      );

  Map<String, dynamic> toExtra() => {extraKey: this};

  Options toOptions() => Options(extra: toExtra());

  Options mergeIn(Options options) {
    return options.copyWith(
      extra: <String, dynamic>{}
        ..addAll(options.extra ?? {})
        ..addAll(toExtra()),
    );
  }

  @override
  String toString() {
    return 'RetryOptions{retries: $retries, retryInterval: $retryInterval, _retryEvaluator: $_retryEvaluator}';
  }
}
