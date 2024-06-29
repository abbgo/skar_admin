import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoordinateInput extends StatelessWidget {
  const CoordinateInput({super.key, required this.ctrl, required this.label});

  final TextEditingController ctrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: label,
        keyboardType: TextInputType.number,
        validatorFunc: (validator) {
          if (validator == null || validator.isEmpty) {
            return lang.pleaseEnterThisInformation;
          }
          return null;
        },
      ),
    );
  }
}
