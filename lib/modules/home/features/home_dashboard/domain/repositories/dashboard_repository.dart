import 'package:q_bank/modules/home/home.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboard();
}
