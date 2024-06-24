import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_phone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPhone2Input extends StatelessWidget {
  const ShopPhone2Input({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return InputPhone(
      ctrl: ctrl,
      label: '${lang.phoneNumber} (2)',
      autofocus: true,
      validatorFunc: (validator) {
        var l = validator.toString().length;
        if (l != 8) return lang.enterYourCorrectPhoneNumber;
        return null;
      },
    );
  }
}
