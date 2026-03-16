import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  try {
    runApp(const MyApp());
  } catch (e, s) {
    debugPrint("DART ERROR: $e");
    debugPrint("$s");
  }
}
