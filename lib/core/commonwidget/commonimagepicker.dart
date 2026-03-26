import 'dart:io';

import 'package:flutter/material.dart';

class CommonimagePicker extends StatelessWidget {
  final String? imagepath;
  final double? height;
  final double? weight;
  final BorderRadius? radius;
  const CommonimagePicker({
    super.key,
    this.imagepath,
    this.height,
    this.weight,
    this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(5),
      child: Image.asset(
        imagepath ?? "No image found error",
        height: height,
        width: weight,
        fit: BoxFit.fill,
      ),
    );
  }
}

class imagepicker extends StatelessWidget {
  final String imagepath;
  final double height;

  const imagepicker({super.key, required this.imagepath, required this.height});

  @override
  Widget build(BuildContext context) {
    if (imagepath.isEmpty) {
      return Container(
        height: height,
        width: height,
        color: Colors.grey[300],
        child: Icon(Icons.image),
      );
    }

    return Image.file(
      File(imagepath),
      height: height,
      width: height,
      fit: BoxFit.cover,
    );
  }
}
