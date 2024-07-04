import 'package:flutter/material.dart';

PopupMenuItem<dynamic> popUpMenuMethod(String text, IconData icon) {
  return PopupMenuItem(
    value: text,
    child: ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      leading: Icon(icon, color: Colors.white),
    ),
  );
}
