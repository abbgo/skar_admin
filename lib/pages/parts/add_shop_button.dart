import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_shop/add_shop.dart';

class AddShopButton extends StatelessWidget {
  const AddShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 5),
      onPressed: () => goToPage(context, const AddShopPage(), false),
      child: Text(lang.addNewShop),
    );
  }
}
