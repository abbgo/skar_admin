import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/profile/parts/language_button.dart';

Future<dynamic> showLanguageMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: Text(
          AppLocalizations.of(context)!.selectLanguage,
          textAlign: TextAlign.center,
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LanguageButton(text: 'Turkmen', lang: 'tr'),
            LanguageButton(text: 'Русский', lang: 'ru'),
          ],
        ),
      );
    },
  );
}
