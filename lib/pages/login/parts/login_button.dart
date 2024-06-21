import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.phoneNumberCtrl,
    required this.passwordCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneNumberCtrl;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          print(phoneNumberCtrl.text);
          print(passwordCtrl.text);
          return;
        }
      },
      child: Text(lang.login),
    );
  }
}
