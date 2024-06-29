import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/pages/parts/input_part.dart';

class ShopNameRuInput extends StatelessWidget {
  const ShopNameRuInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      ctrl: ctrl,
      label: 'Ady (ru) *',
      validatorFunc: (validator) => textInputValidate(validator, context),
    );
  }
}
