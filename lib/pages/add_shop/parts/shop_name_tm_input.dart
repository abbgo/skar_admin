import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopNameTmInput extends StatelessWidget {
  const ShopNameTmInput({super.key, required this.nameTMCtrl});

  final TextEditingController nameTMCtrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return TextFormField(
      controller: nameTMCtrl,
      keyboardType: TextInputType.text,
      autofocus: true,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: elevatedButtonColor,
      decoration: InputDecoration(
        focusedBorder: inputBorder(),
        border: inputBorder(),
        labelText: ' Ady(tm) ',
      ),
      validator: (validator) {
        var l = validator.toString().length;
        if (l < 1) return lang.nameTMRequired;
        return null;
      },
    );
  }
}
