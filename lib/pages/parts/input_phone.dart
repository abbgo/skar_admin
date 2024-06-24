import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';

class InputPhone extends StatelessWidget {
  const InputPhone({
    super.key,
    required this.ctrl,
    required this.label,
    this.validatorFunc,
    this.autofocus,
  });

  final TextEditingController ctrl;
  final String label;
  final String? Function(String?)? validatorFunc;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      maxLength: 8,
      keyboardType: TextInputType.phone,
      autofocus: autofocus ?? false,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: elevatedButtonColor,
      decoration: InputDecoration(
        prefixText: '+993 ',
        focusedBorder: inputBorder(),
        border: inputBorder(),
        labelText: ' $label ',
      ),
      validator: validatorFunc,
    );
  }
}
