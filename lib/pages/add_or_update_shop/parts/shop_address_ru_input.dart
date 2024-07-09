import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopAddressRuInput extends StatelessWidget {
  const ShopAddressRuInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      ctrl: ctrl,
      label: '${AppLocalizations.of(context)!.address} (ru) *',
      maxLines: 3,
      validatorFunc: (validator) => textInputValidate(validator, context),
    );
  }
}
