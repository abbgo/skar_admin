import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItemMethod(
  String label,
  Widget icon,
) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
    backgroundColor: Colors.white,
  );
}
