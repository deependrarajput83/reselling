import 'dart:core';

import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BoxShadow? boxShadow;
  const CommonContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.color,
    this.radius,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(radius ?? 8),
        boxShadow: boxShadow != null ? [boxShadow!] : null,
      ),
      child: child,
    );
  }
}
