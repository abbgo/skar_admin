import 'package:flutter/material.dart';
import 'package:skar_admin/styles/colors.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarTheme lightTabBarTheme = TabBarTheme(
    labelPadding: const EdgeInsets.only(bottom: 10),
    labelStyle: const TextStyle(fontFamily: 'HeyWowRegular'),
    labelColor: elevatedButtonColor,
    indicatorColor: elevatedButtonColor,
    dividerColor: Colors.white,
  );
}
