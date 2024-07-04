import 'package:flutter/material.dart';

PopupMenuItem<dynamic> popUpMenuMethod(
  String text,
  IconData icon,
  Color iconColor,
) {
  return PopupMenuItem(
    value: text,
    child: ListTile(
      title: Text(text),
      leading: Icon(icon, color: iconColor),
    ),
  );
}
