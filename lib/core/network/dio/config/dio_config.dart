import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';

@injectable
class DioConfigs {
  final String baseUrl = ApiRoutes.baseUrl;
  final int receiveTimeout = 60000;
  final int connectionTimeout = 60000;
}
