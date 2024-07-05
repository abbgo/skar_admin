import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';

class ProductOldPriceInput extends StatelessWidget {
  const ProductOldPriceInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      ctrl: ctrl,
      label: 'Kone Bahasy *',
      validatorFunc: null,
    );
  }
}
