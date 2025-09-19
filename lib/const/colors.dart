import 'package:flutter/material.dart';

class AppColors {

  static const Color primaryLight = Color.fromRGBO(60, 105,124, 1);
  static const Color primaryDark = Color.fromRGBO(35, 76, 94, 1.0);

  static final Color backgroundLight = Colors.grey.shade100;
  static final Color backgroundDark = Colors.grey.shade900;

  static final Color cardLight = Colors.grey.shade200;
  static final Color cardDark = Colors.grey.shade900;

  static const Color textLight = Colors.black87;
  static const Color textDark = Colors.white70;

  static const Color danger = Colors.red;
  static const Color success = Colors.green;

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? primaryDark
        : primaryLight;
  }

  static Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? primaryDark
        : primaryLight;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundDark
        : backgroundLight;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cardDark
        : cardLight;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textDark
        : textLight;
  }
}
