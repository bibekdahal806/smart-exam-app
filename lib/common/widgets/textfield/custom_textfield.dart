import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final double borderRadius;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final VoidCallback? onEditing;
  // final EdgeInsets scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIcon,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
    this.borderRadius = AppSpacing.md,
    this.prefixIcon,
    this.onEditing,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    this.cursorHeight,
    this.obscureText = false,
    this.autofillHints,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onFieldSubmitted: onSubmitted,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: (readOnly == null) ? false : readOnly!,
      enableInteractiveSelection: !(readOnly ?? false),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onEditingComplete: onEditing,
      cursorHeight: cursorHeight,
      autofillHints: autofillHints,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      obscureText: obscureText,
      obscuringCharacter: "-",
      decoration: InputDecoration(
        contentPadding: contentPadding,
        label: labelText != null ? Text(labelText ?? "") : null,
        fillColor: fillColor,
        filled: false,
        prefixIcon: prefixIcon,
        // suffixIcon: (suffixIcon != null) ? suffixIcon : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
        hintStyle: hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
    );
  }
}
