import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/shopping_center/shopping_center.dart';

class SelectShopParent extends StatelessWidget {
  const SelectShopParent({
    super.key,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
  });

  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

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
              onPressed: () => goToPage(
                  context,
                  ShoppingCenterPage(
                    latitudeCtrl: latitudeCtrl,
                    longitudeCtrl: longitudeCtrl,
                  ),
                  false),
              child: Text(lang.selectMall),
            ),
          )
        ],
      ),
    );
  }
}
