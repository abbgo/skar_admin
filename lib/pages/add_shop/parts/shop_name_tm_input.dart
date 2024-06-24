import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopNameTmInput extends StatelessWidget {
  const ShopNameTmInput({super.key, required this.nameTMCtrl});

  final TextEditingController nameTMCtrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return InputPart(
      ctrl: nameTMCtrl,
      label: 'Ady(tm)',
      validatorFunc: (validator) {
        var l = validator.toString().length;
        if (l < 1) return lang.nameTMRequired;
        return null;
      },
      autofocus: true,
    );
  }
}
