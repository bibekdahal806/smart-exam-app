import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

class CustomMultipleSelectDropdownTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final bool autofocus;
  final String? Function(String?)? validator;
  final Function()? onValueChange;

  final String hint;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final List<String> dropDownItemLists;
  final List<String> selectedItems;

  const CustomMultipleSelectDropdownTextField({
    super.key,
    required this.hint,
    required this.dropDownItemLists,
    required this.selectedItems,
    this.hintStyle,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.onValueChange,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    this.labelText,
    this.fillColor,
    this.prefixIcon,
    this.borderRadius = 8,
  });

  @override
  State<CustomMultipleSelectDropdownTextField> createState() =>
      _CustomMultipleSelectDropdownTextFieldState();
}

class _CustomMultipleSelectDropdownTextFieldState
    extends State<CustomMultipleSelectDropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        hint: Text(
          widget.hint,
          style:
              widget.hintStyle ??
              Theme.of(context).textTheme.bodySmall?.copyWith(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        value: widget.selectedItems.isEmpty ? null : widget.selectedItems.last,
        items: widget.dropDownItemLists.map((item) {
          return DropdownMenuItem(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = widget.selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    isSelected
                        ? widget.selectedItems.remove(item)
                        : widget.selectedItems.add(item);
                    if (widget.onValueChange != null) {
                      widget.onValueChange!();
                    }
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        if (isSelected)
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(child: Text(item)),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        alignment: Alignment.topLeft,
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        validator: (widget.validator != null) ? widget.validator : null,
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        onChanged: (value) {},
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
          maxHeight: 200,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(5),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        iconStyleData: const IconStyleData(),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(overflow: TextOverflow.ellipsis),
        selectedItemBuilder: (context) {
          return widget.dropDownItemLists.map((item) {
            return Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                widget.selectedItems.join(', '),
                style:
                    widget.hintStyle ??
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
              ),
            );
          }).toList();
        },
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          label: widget.labelText != null ? Text(widget.labelText ?? "") : null,
          fillColor: widget.fillColor,
          filled: false,
          prefixIcon: widget.prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: context.colorScheme.secondary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: context.colorScheme.onErrorContainer),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: context.colorScheme.primaryFixedDim),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: context.colorScheme.error),
          ),
          // hint: hint,
          hintStyle:
              widget.hintStyle ??
              Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(overflow: TextOverflow.ellipsis),
          hintMaxLines: 1,
        ),
      ),
    );
  }
}
