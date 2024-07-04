import 'package:flutter/material.dart';

PopupMenuItem<dynamic> popUpMenuMethod() {
  return PopupMenuItem(
    child: ListTile(
      title: Text('Uytegt'),
      leading: Icon(Icons.edit),
    ),
  );
}
