import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/di/di.dart';

import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());
  final DashboardRepository repository = getIt<DashboardRepository>();

  Future<void> getDashboard() async {
    emit(const DashboardLoading());
    try {
      final dashboard = await repository.getDashboard();
      emit(DashboardLoaded(dashboard));
    } catch (e) {
      emit(DashboardError(AppErrorHandler.getErrorMessage(e)));
    }
  }
}
