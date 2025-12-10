import 'package:flutter/material.dart';

class CenterPopup extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const CenterPopup({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
  });

  @override
  State<CenterPopup> createState() => _CenterPopupState();
}

class _CenterPopupState extends State<CenterPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scale = CurvedAnimation(parent: _controller, curve: widget.curve);
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: FadeTransition(opacity: _fade, child: widget.child),
    );
  }
}
