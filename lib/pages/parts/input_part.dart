import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';

class InputPart extends StatelessWidget {
  const InputPart({
    super.key,
    required this.ctrl,
    this.validatorFunc,
    required this.label,
    this.autofocus,
  });

  final TextEditingController ctrl;
  final String? Function(String?)? validatorFunc;
  final String label;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80.0, minHeight: 80.0),
      child: TextFormField(
        controller: ctrl,
        keyboardType: TextInputType.text,
        autofocus: autofocus ?? false,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' $label ',
        ),
        validator: validatorFunc,
        // validator: (validator) {
        //   var l = validator.toString().length;
        //   if (l < 1) return lang.nameTMRequired;
        //   return null;
        // },
      ),
    );
  }
}
