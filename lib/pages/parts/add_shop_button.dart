import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddShopButton extends StatelessWidget {
  const AddShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 5),
      onPressed: () {},
      child: Text(lang.addNewShop),
    );
  }
}
