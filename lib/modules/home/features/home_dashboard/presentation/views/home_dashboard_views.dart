import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/home/home.dart';

class DashboardHomeSection extends StatelessWidget {
  const DashboardHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading || state is DashboardInitial) {
          return const _DashboardLoadingView();
        }

        if (state is DashboardError) {
          return _DashboardErrorView(
            message: state.message,
            onRetry: () => context.read<DashboardCubit>().getDashboard(),
          );
        }

        if (state is DashboardLoaded) {
          final dashboard = state.dashboard;
          return Column(
            children: [
              SummaryCardsCarousel(summary: dashboard.summary),
              const SizedBox(height: 20),
              PerformanceChartCard(data: dashboard.performanceOvertime),
              const SizedBox(height: 20),
              SubjectwiseStrengthCard(subjects: dashboard.subjectwiseStrength),
            ],
          );
          // return RefreshIndicator(
          //   onRefresh: () => context.read<DashboardCubit>().getDashboard(),
          //   child: ListView(
          //     physics: const NeverScrollableScrollPhysics(),
          //     padding: const EdgeInsets.symmetric(vertical: 16),
          //     children: [

          //     ],
          //   ),
          // );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _DashboardLoadingView extends StatelessWidget {
  const _DashboardLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _DashboardErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _DashboardErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ErrorScreenWidget(
        errorTitle: Messages.somethingWentWrong,
        errorDescription: message,
        onButtonTap: onRetry,
      ),

      // Padding(
      //   padding: const EdgeInsets.all(24),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       const Icon(Icons.error_outline, size: 44, color: Colors.redAccent),
      //       const SizedBox(height: 12),
      //       Text(
      //         message,
      //         textAlign: TextAlign.center,
      //         style: const TextStyle(fontSize: 14),
      //       ),
      //       const SizedBox(height: 14),
      //       ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
      //     ],
      //   ),
      // ),
    );
  }
}
