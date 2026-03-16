import 'package:flutter/material.dart';

class Commontextformfiled extends StatelessWidget {
  final TextEditingController controller;
  final Widget? hintw;
  final String? hint;
  final String? labal;
  final TextInputType? Keywordtype;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? fillcolor;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final int? minLines;
  final int? maxLines;
  const Commontextformfiled({
    super.key,
    required this.controller,
    this.hint,
    this.labal,
    this.Keywordtype,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillcolor,
    this.padding,
    this.hintw,
    this.maxLines,
    this.minLines,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: Keywordtype,
      obscureText: obscureText,
      minLines: minLines,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            padding ?? EdgeInsets.symmetric(vertical: 9, horizontal: 9),
        hintText: hint,
        labelText: labal,
        hintStyle: TextStyle(fontFamily: 'poppins'),
        labelStyle: TextStyle(fontFamily: 'poppins'),
        // prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        fillColor: fillcolor ?? Colors.white,
        hint: hintw,
      ),
    );
  }
}
