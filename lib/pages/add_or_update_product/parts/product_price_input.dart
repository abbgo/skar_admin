import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/pages/parts/input_part.dart';

class ProductPriceInput extends StatelessWidget {
  const ProductPriceInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: ' Bahasy * ',
        validatorFunc: (validator) => textInputValidate(validator, context),
      ),
    );
  }
}
