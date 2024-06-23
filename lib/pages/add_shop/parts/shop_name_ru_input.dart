import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopNameRuInput extends StatelessWidget {
  const ShopNameRuInput({super.key, required this.nameRUCtrl});

  final TextEditingController nameRUCtrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80.0, minHeight: 80.0),
      child: TextFormField(
        controller: nameRUCtrl,
        keyboardType: TextInputType.text,
        autofocus: true,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' Ady(ru) ',
        ),
        validator: (validator) {
          var l = validator.toString().length;
          if (l < 1) return lang.nameRURequired;
          return null;
        },
      ),
    );
  }
}
