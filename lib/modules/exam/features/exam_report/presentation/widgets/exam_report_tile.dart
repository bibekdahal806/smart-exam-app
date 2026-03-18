import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamReportTile extends StatelessWidget {
  final ExamReportEntity exam;

  const ExamReportTile({super.key, required this.exam});

  String _formatDate(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '--';
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return raw;
    return '${parsed.day}/${parsed.month}/${parsed.year}';
  }

  String _formatMarks(num? value) {
    if (value == null) return '--';
    if (value % 1 == 0) return value.toInt().toString();
    return value.toString();
  }

  String _durationText(int? duration) {
    if (duration == null) return '--';
    return '${(duration / 60).toStringAsFixed(2)} min';
  }

  @override
  Widget build(BuildContext context) {
    final obtained = exam.obtainedMarks ?? 0;
    final total = exam.totalMarks ?? 0;
    final percentage = total > 0 ? ((obtained / total) * 100) : 0;

    return InkWell(
      borderRadius: AppBorderRadius.largeBorderRadius,
      onTap: () {
        context.pushNamed(
          Routes.examReportDetail.name,
          extra: ExamReportDetailArgument(examReport: exam),
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md.w),
        decoration: BoxDecoration(
          color: context.customTheme.backgroundPrimary,
          borderRadius: AppBorderRadius.largeBorderRadius,
          border: Border.all(
            color: context.customTheme.primary.withValues(alpha: 0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ParentTextWidget(
                    exam.title ?? 'Exam Report',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                      color: context.customTheme.textPrimary,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Skeleton.unite(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm.w,
                      vertical: AppSpacing.xs.h,
                    ),
                    decoration: BoxDecoration(
                      color: context.customTheme.primary.withValues(
                        alpha: 0.10,
                      ),
                      borderRadius: AppBorderRadius.defaultBorderRadius,
                    ),
                    child: ParentTextWidget(
                      '${percentage.toStringAsFixed(0)}%',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: AppFontWeight.medium,
                        color: context.customTheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            ParentTextWidget(
              'Submitted on ${_formatDate(exam.submittedAt)}',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.customTheme.textSecondary,
              ),
            ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: _InfoBox(
                    label: 'Marks',
                    value:
                        '${_formatMarks(exam.obtainedMarks)}/${_formatMarks(exam.totalMarks)}',
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: _InfoBox(
                    label: 'Duration',
                    value: _durationText(exam.duration),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Skeleton.unite(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sm.w),
        decoration: BoxDecoration(
          color: context.customTheme.backgroundSecondary,
          borderRadius: AppBorderRadius.defaultBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParentTextWidget(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.customTheme.textSecondary,
              ),
            ),
            4.verticalSpace,
            ParentTextWidget(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: AppFontWeight.semiBold,
                color: context.customTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
