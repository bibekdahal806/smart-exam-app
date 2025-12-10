import 'package:injectable/injectable.dart';
import 'package:q_bank/core/utils/constants/app_constants.dart';

@injectable
class DioConfigs {
  final String baseUrl = AppConstants.envBaseUrl;
  final int receiveTimeout = 30000;
  final int connectionTimeout = 30000;
}
