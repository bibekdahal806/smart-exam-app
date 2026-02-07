import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:flutter/material.dart';

class DeleteTile extends StatelessWidget {
  const DeleteTile({
    super.key,
    required this.deleteType,
    required this.title,
    required this.description,
    required this.selectedDeleteType,
    this.onChanged,
  });

  final DeleteType deleteType;
  final String title;
  final String description;
  final DeleteType selectedDeleteType;
  final Function(DeleteType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(deleteType),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              SizedBox.square(
                dimension: AppSpacing.xlg.r,
                child: Radio<DeleteType>(
                  value: deleteType,
                  activeColor: context.customTheme.primary,
                  fillColor: WidgetStateColor.resolveWith((states) {
                    if (states.isSelected) {
                      return context.customTheme.primary;
                    }
                    return AppColors.borderDefault;
                  }),
                ),
              ),
              AppGaps.gapW12,
              Expanded(
                child: ParentTextWidget(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                    color: context.customTheme.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          AppGaps.gapH12,
          ParentTextWidget(
            description,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: AppFontWeight.regular,
              color: context.customTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
