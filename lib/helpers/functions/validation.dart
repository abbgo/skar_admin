import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? textInputValidate(String? validator, BuildContext context) {
  if (validator == null || validator.isEmpty) {
    return AppLocalizations.of(context)!.pleaseEnterThisInformation;
  }
  return null;
}
