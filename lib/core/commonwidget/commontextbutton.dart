import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? ontap;
  const CommonTextButton({super.key, required this.child, this.ontap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(),
      child: child,
    );
  }
}
