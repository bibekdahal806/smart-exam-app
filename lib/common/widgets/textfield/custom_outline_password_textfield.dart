import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class CustomOutlinedPasswordTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
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

  final VoidCallback? onEditing;
  // final EdgeInsets scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Iterable<String>? autofillHints;
  final int? maxLines;

  const CustomOutlinedPasswordTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
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
    this.borderRadius = AppSpacing.sm,
    this.onEditing,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    this.cursorHeight,
    this.autofillHints,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
          return TextFormField(
            focusNode: focusNode,
            maxLength: maxCharacters,
            autofocus: autofocus!,
            textCapitalization: textCapitalization,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
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
            obscureText: !state.isPasswordVisible,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              contentPadding: contentPadding,
              label: labelText != null ? Text(labelText ?? "") : null,
              fillColor: fillColor,
              filled: true,
              suffixIcon: IconButton(
                icon: state.isPasswordVisible
                    ? SizedBox.square(
                        dimension: 20.r,
                        child: SvgViewer.fromAsset(
                          path: AssetRoutes.eyeOpenIconPath,
                          colorFilter: ColorFilter.mode(
                            context.customTheme.icon,
                            BlendMode.srcIn,
                          ),
                          //
                        ),
                      )
                    : SizedBox.square(
                        dimension: 20.r,
                        child: SvgViewer.fromAsset(
                          path: AssetRoutes.eyeCloseIconPath,
                          colorFilter: ColorFilter.mode(
                            context.customTheme.icon,
                            BlendMode.srcIn,
                          ),
                          //
                        ),
                      ),

                onPressed: () {
                  context
                      .read<PasswordVisibilityCubit>()
                      .togglePasswordVisibility();
                },
              ),
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
              hintText: hint,
              hintStyle: hintStyle,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(),
          );
        },
      ),
    );
  }
}
