import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/shopping_center/shopping_center.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';

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
            '${lang.ifYourStoreIsLocatedInsideMallSelectMall} :',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Consumer(
            builder: (context, ref, child) {
              SelectedShop selectedShop =
                  ref.watch(selectedShoppincCenterProvider);
              bool isTM = ref.watch(langProvider) == 'tr';

              return selectedShop == SelectedShop.defaultSelectedShop()
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        isTM ? selectedShop.nameTM : selectedShop.nameRU,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            },
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
