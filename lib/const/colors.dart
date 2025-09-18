import 'package:flutter/material.dart';

class AppColors {
  // Cores principais
  static const Color primaryLight = Color.fromRGBO(60, 105,124, 1);
  static const Color primaryDark = Color.fromRGBO(35, 76, 94, 1.0);

  static const Color secondaryLight = Colors.blue;
  static const Color secondaryDark = Colors.deepPurple;

  // Backgrounds
  static final Color backgroundLight = Colors.grey.shade100;
  static final Color backgroundDark = Colors.black;

  // Cards
  static final Color cardLight = Colors.grey.shade200;
  static final Color cardDark = Colors.grey.shade900;

  // Textos
  static const Color textLight = Colors.black87;
  static const Color textDark = Colors.white70;

  // Erros, alerts, etc
  static const Color danger = Colors.red;
  static const Color success = Colors.green;


  // Helpers que pegam do contexto
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? primaryDark
        : primaryLight;
  }

  // Helpers que pegam do contexto
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
