import 'package:flutter/material.dart';
import 'app_theme.dart';

class NeoButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final Color? shadowColor;
  final double depth;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool isCircle;

  const NeoButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color = Colors.white,
    this.shadowColor,
    this.depth = 6.0,
    this.borderWidth = 3.0,
    this.padding,
    this.borderRadius,
    this.isCircle = false,
  });

  @override
  State<NeoButton> createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final sColor = widget.shadowColor ?? AppTheme.primary;
    final decoration = BoxDecoration(
      color: widget.color,
      shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: widget.isCircle ? null : (widget.borderRadius ?? BorderRadius.zero),
      border: Border.all(color: AppTheme.primary, width: widget.borderWidth),
    );

    final shadowDecoration = BoxDecoration(
      color: sColor,
      shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: widget.isCircle ? null : (widget.borderRadius ?? BorderRadius.zero),
      border: Border.all(color: AppTheme.primary, width: widget.borderWidth),
    );

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow Base
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(widget.depth, widget.depth),
              child: Container(
                decoration: shadowDecoration,
              ),
            ),
          ),
          // Interactive Top Layer
          AnimatedContainer(
            duration: const Duration(milliseconds: 70),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(
              _isPressed ? widget.depth : 0,
              _isPressed ? widget.depth : 0,
              0,
            ),
            decoration: decoration,
            padding: widget.padding,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
