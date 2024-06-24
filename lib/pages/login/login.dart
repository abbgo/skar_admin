import 'package:flutter/material.dart';
import 'package:skar_admin/pages/login/parts/login_button.dart';
import 'package:skar_admin/pages/login/parts/phone_number_field.dart';
import 'package:skar_admin/pages/login/parts/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  void dispose() {
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

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
                    PhoneNumberField(ctrl: phoneNumberCtrl),
                    PasswordField(passwordCtrl: passwordCtrl),
                    LoginButton(
                      formKey: formKey,
                      phoneNumberCtrl: phoneNumberCtrl,
                      passwordCtrl: passwordCtrl,
                    ),
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
