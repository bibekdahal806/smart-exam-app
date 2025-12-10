import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

class ParentPaddingWidget extends StatelessWidget {
  ParentPaddingWidget({
    super.key,
    required this.child,
    double? left,
    double? top,
    double? right,
    double? bottom,

    this.hasSafeArea = false,
  }) : left = left ?? AppSpacing.lg.w,
       top = top ?? AppSpacing.lg.h,
       right = right ?? AppSpacing.lg.w,
       bottom = bottom ?? AppSpacing.lg.h;
  final Widget child;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final bool hasSafeArea;

  @override
  Widget build(BuildContext context) {
    return hasSafeArea
        ? SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: left,
                top: top,
                right: right,
                bottom: bottom,
              ),
              child: child,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              left: left,
              top: top,
              right: right,
              bottom: bottom,
            ),
            child: child,
          );
  }
}
