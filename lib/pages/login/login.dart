import 'package:flutter/material.dart';
import 'package:skar_admin/pages/login/parts/login_field.dart';
import 'package:skar_admin/pages/login/parts/password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginField(),
            PasswordField(),
          ],
        ),
      ),
    );
  }
}
