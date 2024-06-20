import 'package:flutter/material.dart';
import 'package:skar_admin/styles/colors.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: outlinedInputBorder(),
    labelStyle: TextStyle(color: elevatedButtonColor),
  );
}

OutlineInputBorder outlinedInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: elevatedButtonColor),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  );
}
