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
    final tempSelectedSubjects = Set<String>.from(
      loadExamReportState.selectedSubjects,
    );

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.customTheme.backgroundPrimary,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                      'Select one or more subjects to narrow down your exam reports.',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.customTheme.textSecondary,
                      ),
                    ),
                    AppGaps.gapH16,
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton.outlined(
                            onTap: () {
                              setModalState(tempSelectedSubjects.clear);
                            },
                            bgColor: context.customTheme.backgroundSecondary,
                            border: Border.all(
                              color: context.customTheme.border,
                            ),
                            label: 'Clear',
                            labelStyle: context.textTheme.bodyMedium?.copyWith(
                              color: context.customTheme.textPrimary,
                              fontWeight: AppFontWeight.semiBold,
                            ),
                            constraints: BoxConstraints.expand(height: 48.r),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              cubit.filterBySubjects(
                                tempSelectedSubjects.toList(),
                              );
                              Navigator.of(context).pop();
                            },
                            label: tempSelectedSubjects.isEmpty
                                ? 'Show All'
                                : 'Apply (${tempSelectedSubjects.length})',
                            constraints: BoxConstraints.expand(height: 48.r),
                            labelStyle: context.textTheme.bodyMedium?.copyWith(
                              color: context.customTheme.textInverse,
                              fontWeight: AppFontWeight.semiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.gapH16,
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 360.h),
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: loadExamReportState.availableSubjects.map((
                            subject,
                          ) {
                            final isSelected = tempSelectedSubjects.contains(
                              subject,
                            );

                            return _FilterOptionChip(
                              title: subject,
                              isSelected: isSelected,
                              onTap: () {
                                setModalState(() {
                                  if (isSelected) {
                                    tempSelectedSubjects.remove(subject);
                                  } else {
                                    tempSelectedSubjects.add(subject);
                                  }
                                });
                              },
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = loadExamReportState.selectedSubjects.length;

    return FloatingActionButton.extended(
      onPressed: () => _openFilterSheet(context),
      backgroundColor: context.customTheme.primary,
      foregroundColor: context.customTheme.textInverse,
      icon: const Icon(Icons.tune_rounded),
      label: ParentTextWidget(
        selectedCount == 0
            ? 'Filter'
            : selectedCount == 1
            ? '1 filter'
            : '$selectedCount filters',
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.customTheme.textInverse,
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );
  }
}

class _FilterOptionChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOptionChip({
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
