import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductOldPriceInput extends StatelessWidget {
  const ProductOldPriceInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: ' ${AppLocalizations.of(context)!.oldPrice} ',
        validatorFunc: null,
      ),
    );
  }
}
