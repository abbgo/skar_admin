import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_phone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPhoneInput extends StatelessWidget {
  const ShopPhoneInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return InputPhone(
      ctrl: ctrl,
      label: '${lang.phoneNumber} *',
      validatorFunc: (validator) {
        var l = validator.toString().length;
        if (l != 8) return lang.enterYourCorrectPhoneNumber;
        return null;
      },
    );
  }
}
