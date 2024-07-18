import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

String? textInputValidate(String? validator, BuildContext context) {
  if (validator == null || validator.isEmpty) {
    return AppLocalizations.of(context)!.pleaseEnterThisInformation;
  }
  return null;
}

Future<void> wrongToken(
    String error, dynamic ref, BuildContext? context) async {
  if (error == 'auth error') {
    await ref.read(accessTokenProvider.notifier).update('');
    if (context != null && context.mounted) {
      goToHomePage(context);
    }
  }
}
