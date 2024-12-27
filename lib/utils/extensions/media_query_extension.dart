import 'package:flutter/material.dart';

class MediaQueryExtension {
  static mediaQuery(BuildContext context, double value, {String direction = 'V'}) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    if (direction.toUpperCase() == 'H') {
      return size.height * value;
    } else {
      return size.width * value;
    }
  }
}