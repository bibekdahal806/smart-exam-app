import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/home/home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardHomeSection extends StatelessWidget {
  const DashboardHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading || state is DashboardInitial) {
          return Skeletonizer(
            child: HomeDashboardSuccessView(dashboard: dashboardDummyData),
          );
        }

        if ((state is DashboardError)) {
          return _DashboardErrorView(
            message: state.message,
            onRetry: () => context.read<DashboardCubit>().getDashboard(),
          );
        }

        if (state is DashboardLoaded) {
          return HomeDashboardSuccessView(dashboard: state.dashboard);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _DashboardErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _DashboardErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        100.verticalSpace,
        Center(
          child: ErrorScreenWidget(
            errorTitle: Messages.somethingWentWrong,
            errorDescription: message,
            onButtonTap: onRetry,
          ),
        ),
      ],
    );
  }
}
