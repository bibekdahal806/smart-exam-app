import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportDetailQuestionCard extends StatelessWidget {
  final QuestionReportEntity? question;

  const ExamReportDetailQuestionCard({super.key, required this.question});

  String _answerText(dynamic value) {
    if (value == null) return '--';

    if (value is List) {
      if (value.isEmpty) return '--';
      return value.join(', ');
    }

    return value.toString().trim().isEmpty ? '--' : value.toString();
  }

  String _formatMarks(num? value) {
    if (value == null) return '--';
    if (value % 1 == 0) return value.toInt().toString();
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final item = question;
    if (item == null) return const SizedBox.shrink();

    final obtained = item.obtainedMarks ?? 0;
    final full = item.fullMarks ?? 0;
    final isCorrect = full > 0 && obtained >= full;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: AppSpacing.md.h),
      padding: EdgeInsets.all(AppSpacing.md.w),
      decoration: BoxDecoration(
        color: context.customTheme.backgroundPrimary,
        borderRadius: AppBorderRadius.largeBorderRadius,
        border: Border.all(
          color: context.customTheme.border.withValues(alpha: 0.25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm.w,
                  vertical: AppSpacing.xs.h,
                ),
                decoration: BoxDecoration(
                  color: context.customTheme.primary.withValues(alpha: 0.10),
                  borderRadius: AppBorderRadius.defaultBorderRadius,
                ),
                child: ParentTextWidget(
                  'Q${item.orderId ?? '--'}',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: AppFontWeight.medium,
                    color: context.customTheme.primary,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm.w,
                  vertical: AppSpacing.xs.h,
                ),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Colors.green.withValues(alpha: 0.10)
                      : Colors.orange.withValues(alpha: 0.10),
                  borderRadius: AppBorderRadius.defaultBorderRadius,
                ),
                child: ParentTextWidget(
                  '${_formatMarks(item.obtainedMarks)} / ${_formatMarks(item.fullMarks)}',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: AppFontWeight.medium,
                    color: isCorrect ? Colors.green : Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          ParentTextWidget(
            item.text ?? '--',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: AppFontWeight.semiBold,
              color: context.customTheme.textPrimary,
            ),
          ),
          8.verticalSpace,
          ParentTextWidget(
            item.type.value.capitalize(),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.customTheme.textSecondary,
            ),
          ),
          12.verticalSpace,
          _AnswerSection(
            title: 'Correct Answer',
            value: _answerText(item.correctAnswer),
          ),
          8.verticalSpace,
          _AnswerSection(
            title: 'Submitted Answer',
            value: _answerText(item.submittedAnswer),
          ),
          if ((item.id ?? '').trim().isNotEmpty) ...[
            12.verticalSpace,
            Divider(
              color: context.customTheme.border.withValues(alpha: 0.25),
              height: 1,
            ),
            8.verticalSpace,
            ParentTextWidget(
              'Question ID: ${item.id}',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.customTheme.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AnswerSection extends StatelessWidget {
  final String title;
  final String value;

  const _AnswerSection({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.sm.w),
      decoration: BoxDecoration(
        color: context.customTheme.backgroundSecondary,
        borderRadius: AppBorderRadius.defaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParentTextWidget(
            title,
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
