import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          print('hemme zat dogry');
        }
      },
      child: Text(lang.add),
    );
  }
}
