import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportSubjectFilterFab extends StatelessWidget {
  final LoadExamReportState loadExamReportState;

  const ExamReportSubjectFilterFab({
    super.key,
    required this.loadExamReportState,
  });

  Future<void> _openFilterSheet(BuildContext context) async {
    final cubit = context.read<LoadExamReportCubit>();
    final selectedSubject = loadExamReportState.selectedSubject;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.customTheme.backgroundPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.lg.w,
              AppSpacing.lg.h,
              AppSpacing.lg.w,
              AppSpacing.xlg.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.customTheme.border,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
                AppGaps.gapH16,
                ParentTextWidget(
                  'Filter By Subject',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                    color: context.customTheme.textPrimary,
                  ),
                ),
                AppGaps.gapH4,
                ParentTextWidget(
                  'Choose a subject to narrow down your exam reports.',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.customTheme.textSecondary,
                  ),
                ),
                AppGaps.gapH16,
                _FilterOptionTile(
                  title: 'All Subjects',
                  isSelected: selectedSubject == null,
                  onTap: () {
                    cubit.filterBySubject(null);
                    Navigator.of(context).pop();
                  },
                ),
                AppGaps.gapH8,
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: loadExamReportState.availableSubjects.map((
                        subject,
                      ) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.sm.h),
                          child: _FilterOptionTile(
                            title: subject,
                            isSelected: selectedSubject == subject,
                            onTap: () {
                              cubit.filterBySubject(subject);
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedSubject = loadExamReportState.selectedSubject;

    return FloatingActionButton.extended(
      onPressed: () => _openFilterSheet(context),
      backgroundColor: context.customTheme.primary,
      foregroundColor: context.customTheme.textInverse,
      icon: const Icon(Icons.tune_rounded),
      label: ParentTextWidget(
        selectedSubject ?? 'Filter',
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.customTheme.textInverse,
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );
  }
}

class _FilterOptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOptionTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg.w,
            vertical: AppSpacing.md.h,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? context.customTheme.primary.withValues(alpha: 0.10)
                : context.customTheme.backgroundSecondary,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? context.customTheme.primary
                  : context.customTheme.border,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: ParentTextWidget(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? context.customTheme.primary
                        : context.customTheme.textPrimary,
                    fontWeight: isSelected
                        ? AppFontWeight.semiBold
                        : AppFontWeight.medium,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: context.customTheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
