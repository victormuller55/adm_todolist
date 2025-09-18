import 'package:adm_todolist/const/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    listTileTheme: ListTileThemeData(tileColor: Colors.grey.shade200),
    switchTheme: SwitchThemeData(
      overlayColor: WidgetStateProperty.all(Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardLight,
      shadowColor: Colors.grey.shade400,
      margin: const EdgeInsets.all(10),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.all(AppColors.primaryDark),
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.all(AppColors.primaryDark),
      overlayColor: WidgetStateProperty.all(AppColors.primaryDark),
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.grey.shade900),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardDark,
      shadowColor: Colors.black,
      margin: const EdgeInsets.all(10),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
  );
}
