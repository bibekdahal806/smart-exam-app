import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

@Injectable(as: RemoteService)
class RemoteServiceImpl extends RemoteService {
  final _client = getIt<DioClient>();
  final _config = getIt<DioConfigs>();

  FormData _buildFormData({
    required Map<String, dynamic> body,
    required Map<String, File> files,
  }) {
    final entries = <String, dynamic>{}
      ..addAll(body)
      ..addAll(
        files.map((k, f) => MapEntry(k, MultipartFile.fromFileSync(f.path))),
      );
    return FormData.fromMap(entries);
  }

  @override
  Future getResponse({
    String? baseUrl,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  }) async {
    try {
      final response = await _client
          .addInterceptors([
            RetryInterceptor(
              dio: _client.dio,
              refreshTokenCallback: _refreshAccessToken,
            ),
            AuthInterceptor(
              isTokenRequired: isTokenRequired,
              accessToken: accessToken,
            ),
          ])
          .get(
            '${baseUrl ?? _config.baseUrl}/$endPoint',
            queryParameters: queryParameters,
            cancelToken: GlobalCancelTokenManager.token,
          );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future postResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  }) async {
    try {
      final bool hasFiles = files.isNotEmpty;
      final data = hasFiles && payloadObj != null
          ? _buildFormData(body: payloadObj, files: files)
          : payloadObj;

      final response = await _client
          .addInterceptors([
            RetryInterceptor(
              dio: _client.dio,
              refreshTokenCallback: _refreshAccessToken,
            ),
            AuthInterceptor(
              isTokenRequired: isTokenRequired,
              accessToken: accessToken,
            ),
          ])
          .post(
            '${_config.baseUrl}/$endPoint',
            queryParameters: queryParameters,
            data: data,
            cancelToken: GlobalCancelTokenManager.token,
            options: Options(
              extra: {
                'originalBody': payloadObj,
                'hasFiles': hasFiles,
                'files': files,
              },
            ),
          );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future patchResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  }) async {
    try {
      final bool hasFiles = files.isNotEmpty;
      final data = hasFiles && payloadObj != null
          ? _buildFormData(body: payloadObj, files: files)
          : payloadObj;

      final response = await _client
          .addInterceptors([
            RetryInterceptor(
              dio: _client.dio,
              refreshTokenCallback: _refreshAccessToken,
            ),
            AuthInterceptor(
              isTokenRequired: isTokenRequired,
              accessToken: accessToken,
            ),
          ])
          .patch(
            '${_config.baseUrl}/$endPoint',
            queryParameters: queryParameters,
            data: data,
            cancelToken: GlobalCancelTokenManager.token,
            options: Options(
              extra: {
                'originalBody': payloadObj,
                'hasFiles': hasFiles,
                'files': files,
              },
            ),
          );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future putResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  }) async {
    try {
      final bool hasFiles = files.isNotEmpty;
      final data = hasFiles && payloadObj != null
          ? _buildFormData(body: payloadObj, files: files)
          : payloadObj;

      final response = await _client
          .addInterceptors([
            RetryInterceptor(
              dio: _client.dio,
              refreshTokenCallback: _refreshAccessToken,
            ),
            AuthInterceptor(
              isTokenRequired: isTokenRequired,
              accessToken: accessToken,
            ),
          ])
          .put(
            '${_config.baseUrl}/$endPoint',
            queryParameters: queryParameters,
            data: data,
            cancelToken: GlobalCancelTokenManager.token,
            options: Options(
              extra: {
                'originalBody': payloadObj,
                'hasFiles': hasFiles,
                'files': files,
              },
            ),
          );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future deleteResponse({
    required String endPoint,
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  }) async {
    try {
      final response = await _client
          .addInterceptors([
            RetryInterceptor(
              dio: _client.dio,
              refreshTokenCallback: _refreshAccessToken,
            ),
            AuthInterceptor(
              isTokenRequired: isTokenRequired,
              accessToken: accessToken,
            ),
          ])
          .delete(
            '${_config.baseUrl}/$endPoint',
            cancelToken: GlobalCancelTokenManager.token,
          );
      if (response.statusCode == 204) {
        return;
      }
      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  Future<String?> _refreshAccessToken() async {
    final refreshToken =
        await SecureStorageHelper.instance.getData(
          key: "HiveTableKeys.refreshTokenKey",
        ) ??
        '';

    if (refreshToken.isNullOrEmpty) {
      return null;
    }

    try {
      final newDio = Dio(
        BaseOptions(
          baseUrl: _config.baseUrl,
          connectTimeout: Duration(milliseconds: _config.connectionTimeout),
          receiveTimeout: Duration(milliseconds: _config.receiveTimeout),
        ),
      );
      final response = await newDio.post(
        '${_config.baseUrl}/${ApiRoutes.refreshTokenEndPoint}',
        data: {'refresh': refreshToken},
      );

      final newAccessToken = response.data['data']['access'];
      final newRefreshToken = response.data['data']['refresh'];
      await SecureStorageHelper.instance.setData(
        key: "HiveTableKeys.accessTokenKey",
        value: newAccessToken,
      );
      await SecureStorageHelper.instance.setData(
        key: "HiveTableKeys.refreshTokenKey",
        value: newRefreshToken,
      );
      return newAccessToken;
    } catch (_) {
      return null;
    }
  }
}
