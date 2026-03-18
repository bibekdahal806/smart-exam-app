import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportDetailTopCard extends StatelessWidget {
  final ExamReportEntity examReport;

  const ExamReportDetailTopCard({super.key, required this.examReport});

  String _formatDateTime(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '--';
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return raw;
    return '${parsed.day}/${parsed.month}/${parsed.year} ${_formatTime(parsed)}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour == 0
        ? 12
        : date.hour > 12
        ? date.hour - 12
        : date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  String _formatMarks(num? value) {
    if (value == null) return '--';
    if (value % 1 == 0) return value.toInt().toString();
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final obtained = examReport.obtainedMarks ?? 0;
    final total = examReport.totalMarks ?? 0;
    final percentage = total > 0 ? ((obtained / total) * 100) : 0;

    return Container(
      width: double.infinity,
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
          ParentTextWidget(
            examReport.title ?? 'Exam Report',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: context.customTheme.textPrimary,
            ),
          ),
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSpacing.md.w),
            decoration: BoxDecoration(
              color: context.customTheme.primary.withValues(alpha: 0.08),
              borderRadius: AppBorderRadius.largeBorderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParentTextWidget(
                  'Score',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.customTheme.textSecondary,
                  ),
                ),
                4.verticalSpace,
                ParentTextWidget(
                  '${_formatMarks(examReport.obtainedMarks)} / ${_formatMarks(examReport.totalMarks)}',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: context.customTheme.primary,
                  ),
                ),
                4.verticalSpace,
                ParentTextWidget(
                  '${percentage.toStringAsFixed(0)}% achieved',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFontWeight.medium,
                    color: context.customTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _ReportMetaItem(
                  label: 'Created At',
                  value: _formatDateTime(examReport.createdAt),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _ReportMetaItem(
                  label: 'Started At',
                  value: _formatDateTime(examReport.startedAt),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _ReportMetaItem(
                  label: 'Duration',
                  value: examReport.duration == null
                      ? '--'
                      : '${((examReport.duration ?? 0) / 60).toStringAsFixed(2)} min',
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _ReportMetaItem(
                  label: 'Submitted At',
                  value: _formatDateTime(examReport.submittedAt),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReportMetaItem extends StatelessWidget {
  final String label;
  final String value;

  const _ReportMetaItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontWeight: AppFontWeight.medium,
              color: context.customTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
