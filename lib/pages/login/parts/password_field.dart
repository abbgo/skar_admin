import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return TextField(
      autofocus: true,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: elevatedButtonColor,
      decoration: InputDecoration(
        focusedBorder: inputBorder(),
        border: inputBorder(),
        hintText: lang.username,
      ),
    );
  }
}
