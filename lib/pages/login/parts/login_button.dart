import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          print('hemme zat gowy');
          return;
        }
      },
      child: Text(lang.login),
    );
  }
}
