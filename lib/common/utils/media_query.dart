import 'package:flutter/material.dart';

extension MediaQueryUtils on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
}
