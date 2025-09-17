import 'package:flutter/material.dart';

class AppColors {
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }
}