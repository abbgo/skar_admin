import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopAddressTmInput extends StatelessWidget {
  const ShopAddressTmInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return InputPart(
      ctrl: ctrl,
      label: 'Salgysy (tm) *',
      validatorFunc: (validator) {
        var l = validator.toString().length;
        if (l < 1) return lang.pleaseEnterThisInformation;
        return null;
      },
    );
  }
}
