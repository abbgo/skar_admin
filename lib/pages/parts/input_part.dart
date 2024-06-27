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
    this.keyboardType,
    this.maxLines,
  });

  final TextEditingController ctrl;
  final String? Function(String?)? validatorFunc;
  final String label;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxLines == null ? 80 : 130,
        minHeight: maxLines == null ? 80 : 130,
      ),
      child: TextFormField(
        maxLines: maxLines ?? 1,
        controller: ctrl,
        keyboardType: keyboardType ?? TextInputType.text,
        autofocus: autofocus ?? false,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' $label ',
        ),
        validator: validatorFunc,
      ),
    );
  }
}
