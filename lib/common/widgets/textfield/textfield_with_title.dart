import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/utils/utils.dart';

class TextfieldWithTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget textField;
  const TextfieldWithTitle({
    super.key,
    required this.title,
    this.titleStyle,
    required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParentTextWidget(
          title,
          style:
              titleStyle ??
              context.textTheme.bodyMedium?.copyWith(
                fontWeight: AppFontWeight.semiBold,
                color: context.customTheme.textPrimary,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        AppGaps.gapH8,
        textField,
      ],
    );
  }
}
