import 'package:flutter/material.dart';
import 'package:skar_admin/pages/login/parts/login_button.dart';
import 'package:skar_admin/pages/login/parts/login_field.dart';
import 'package:skar_admin/pages/login/parts/password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/images/logo.jpg")),
            const Expanded(
              flex: 2,
              child: Column(
                children: [
                  LoginField(),
                  SizedBox(height: 20),
                  PasswordField(),
                  SizedBox(height: 20),
                  LoginButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
