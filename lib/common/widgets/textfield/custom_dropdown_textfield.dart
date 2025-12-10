import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

///for dropdown field
class CustomOutlinedDropdownField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool autofocus;
  final String? Function(String?)? validator;
  final Function(String)? onValueChange;

  final String hint;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final double borderRadius;

  final List<DropdownMenuItem<String>> dropDownItemLists;
  final String? itemValue;
  final double? maxHeight;

  const CustomOutlinedDropdownField({
    super.key,
    required this.hint,
    required this.dropDownItemLists,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.onValueChange,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    this.labelText,
    this.fillColor,
    this.prefixIcon,
    this.borderRadius = 8,
    this.itemValue,
    this.maxHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        alignment: Alignment.topLeft,
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
        value: itemValue,
        items: dropDownItemLists,
        focusNode: focusNode,
        autofocus: autofocus,
        validator: (validator != null) ? validator : null,
        onChanged: (text) {
          if (onValueChange != null) {
            onValueChange!(text!);
          }
        },
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          openInterval: const Interval(0, 0.9, curve: Curves.easeIn),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.colorScheme.surfaceBright,
          ),
          maxHeight: maxHeight,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(5),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        iconStyleData: const IconStyleData(
          // iconEnabledColor: AppColors.primarycolor,
        ),
        hint: Text(
          hint,
          style: hintStyle ?? Theme.of(context).textTheme.bodySmall?.copyWith(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          label: labelText != null ? Text(labelText ?? "") : null,
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: context.customTheme.border),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: context.customTheme.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: context.customTheme.border),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: context.customTheme.error),
          ),
          // hint: hint,
          hintStyle:
              hintStyle ??
              Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(overflow: TextOverflow.ellipsis),
          hintMaxLines: 1,
        ),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
