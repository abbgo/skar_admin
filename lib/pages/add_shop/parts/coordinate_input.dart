import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/pages/parts/input_part.dart';

class CoordinateInput extends StatelessWidget {
  const CoordinateInput({super.key, required this.ctrl, required this.label});

  final TextEditingController ctrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: label,
        keyboardType: TextInputType.number,
        validatorFunc: (validator) => textInputValidate(validator, context),
      ),
    );
  }
}
