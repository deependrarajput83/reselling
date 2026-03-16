import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Widget? child;
  final Color? background;
  final Color? foregroundColor;
  final OutlinedBorder? shape;
  final double? radius;
  final BorderSide? side;
  final double? widht;
  final double? height;
  final VoidCallback? OnPressed;
  final EdgeInsetsGeometry? padding;
  const CommonButton({
    super.key,
    this.child,
    this.background,
    this.foregroundColor,
    this.shape,
    this.radius,
    required this.OnPressed,
    this.side,
    this.widht,
    this.height,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foregroundColor ?? Colors.white,
        minimumSize: Size(widht ?? 48, height ?? 48),
        overlayColor: Colors.red,
        shadowColor: Colors.transparent,
        side: side,
        padding: padding,
        shape:
            shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
      ),
      onPressed: OnPressed,
      child: child,
    );
  }
}
