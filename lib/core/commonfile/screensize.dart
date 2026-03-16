import 'package:flutter/cupertino.dart';

class Screensize {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double weight(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
