import 'package:flutter/material.dart';
import 'package:skar_admin/pages/start.dart';
import 'package:skar_admin/styles/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}
