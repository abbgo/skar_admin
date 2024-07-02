import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/shop_parents/shop_parents.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectShopParent extends StatelessWidget {
  const SelectShopParent({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.ifYourStoreIsLocatedInsideMallSelectMall,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  goToPage(context, const ShopParentsPage(), false),
              child: Text(lang.selectMall),
            ),
          )
        ],
      ),
    );
  }
}
