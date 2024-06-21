import 'package:flutter/material.dart';
import 'package:skar_admin/pages/login/parts/login_button.dart';
import 'package:skar_admin/pages/login/parts/login_field.dart';
import 'package:skar_admin/pages/login/parts/password_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.asset("assets/images/logo.jpg")),
            Expanded(
              flex: 2,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const LoginField(),
                    const PasswordField(),
                    LoginButton(formKey: formKey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
