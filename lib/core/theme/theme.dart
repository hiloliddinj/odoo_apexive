import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import 'theme_utils.dart';

final _darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(),
);

/// Light theme
final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light().copyWith(
    onSurfaceVariant: const Color.fromRGBO(255, 198, 41, 1),
    onPrimaryContainer: Colors.black,
  ),
  scaffoldBackgroundColor: AppColors.appColorDark,
  cardColor: AppColors.cardColorLight,
  textTheme: _darkTheme.textTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.cardColorLight,
      surfaceTintColor: AppColors.cardColorLight,
      shadowColor: AppColors.cardColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: ThemeUtils.formBorder(Colors.white),
    enabledBorder: ThemeUtils.formBorder(Colors.white),
    focusedBorder: ThemeUtils.formBorder(Colors.white),
    hintStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: Colors.white),
  ),
  cardTheme: CardTheme(
    color: AppColors.cardColorLight,
    shadowColor: AppColors.cardColorLight,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.symmetric(vertical: 4),
    surfaceTintColor: Colors.transparent,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white,
    dividerColor: Colors.grey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
    ),
  ),
  dividerColor: Colors.white,
  dividerTheme: const DividerThemeData(color: AppColors.cardColorLight),
  canvasColor: Colors.white,
);
