import 'package:flutter/material.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'HeyWowRegular',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    centerTitle: true,
  );
}
