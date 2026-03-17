import '../../domain/entities/dashboard_entity.dart';

abstract class DashboardState {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardLoaded extends DashboardState {
  final DashboardEntity dashboard;

  const DashboardLoaded(this.dashboard);
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);
}
