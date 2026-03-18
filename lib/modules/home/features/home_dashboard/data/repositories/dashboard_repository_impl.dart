import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/home/home.dart';

@Injectable(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final RemoteService _remoteService = getIt<RemoteService>();

  @override
  Future<DashboardEntity> getDashboard() async {
    try {
      // return dashboardDummyData;
      final response = await _remoteService.getResponse(
        endPoint: ApiRoutes.dashboardEndPoint,
        isTokenRequired: true,
      );

      final data = response?['data'];

      if (data == null) {
        throw ServerException("Unable to fetch dashboard data");
      }

      return DashboardMapper.fromJsonToEntity(data);
      // return DashboardModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
