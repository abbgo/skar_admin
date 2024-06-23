import 'package:flutter/material.dart';
import 'package:skar_admin/styles/theme/parts/app_bar_theme.dart';
import 'package:skar_admin/styles/theme/parts/bottom_navigation_bar_theme.dart';
import 'package:skar_admin/styles/theme/parts/card_theme.dart';
import 'package:skar_admin/styles/theme/parts/checkbox_theme.dart';
import 'package:skar_admin/styles/theme/parts/elevated_button_theme.dart';
import 'package:skar_admin/styles/theme/parts/floating_action_button_theme.dart';
import 'package:skar_admin/styles/theme/parts/icon_button_theme.dart';
import 'package:skar_admin/styles/theme/parts/icon_theme.dart';
import 'package:skar_admin/styles/theme/parts/input_theme.dart';
import 'package:skar_admin/styles/theme/parts/tab_bar_theme.dart';
import 'package:skar_admin/styles/theme/parts/text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'HeyWowRegular',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckBoxTheme.checkboxThemeData,
    dialogBackgroundColor: Colors.white,
    bottomNavigationBarTheme:
        AppBottomNavigationBar.lightBottomNavigationBarThemeData,
    iconButtonTheme: AppIconButtonTheme.lightIconButtonTheme,
    inputDecorationTheme: AppInputTheme.lightInputTheme,
    cardTheme: AppCardTheme.lightCardTheme,
    tabBarTheme: AppTabBarTheme.lightTabBarTheme,
    floatingActionButtonTheme:
        AppFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    iconTheme: AppIconTheme.lightIconTheme,
  );
}
