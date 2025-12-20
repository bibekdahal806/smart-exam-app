import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/core/errors/error_parser.dart';

// dio_error.dart
class DioExceptionUtil {
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Network connection failed';
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.receiveTimeout:
        return 'Server response timeout';
      case DioExceptionType.sendTimeout:
        return 'Data sending timeout';
      case DioExceptionType.badCertificate:
        return 'Invalid security certificate';
      case DioExceptionType.badResponse:
        return _handleResponseError(error);
      case DioExceptionType.unknown:
        return 'Network error occurred';
    }
  }

  static String _handleResponseError(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;

    switch (statusCode) {
      case 400:
        return parseErrorMapToString(data);
      case 401:
        return 'Authentication failed';
      case 403:
        return 'Access denied';
      case 404:
        return 'Resource not found';
      case 429:
        return 'Too many requests';
      case 500:
        return 'Internal server error';
      case 502:
      case 503:
      case 504:
        return 'Service unavailable';
      default:
        debugPrint('[DIO ERROR] $statusCode: ${data.toString()}');
        try {
          return data['message'].toString();
        } catch (e) {
          return 'Request failed ($statusCode)';
        }
      // return 'Request failed ($statusCode)';
    }
  }
}
