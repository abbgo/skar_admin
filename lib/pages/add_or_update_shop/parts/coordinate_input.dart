import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';

class CoordinateInput extends StatelessWidget {
  const CoordinateInput({
    super.key,
    required this.ctrl,
    required this.label,
    required this.errorString,
  });

  final TextEditingController ctrl;
  final String label;
  final String errorString;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: label,
        keyboardType: TextInputType.number,
        validatorFunc: (validator) {
          if (validator == null ||
              validator.isEmpty ||
              validator == '0' ||
              validator == '0.0') {
            return errorString;
          }
          return null;
        },
      ),
    );
  }
}
