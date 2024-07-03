import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';
import 'package:skar_admin/services/api/shop.dart';

class AddOrUpdateShopButton extends ConsumerWidget {
  const AddOrUpdateShopButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.addressTMCtrl,
    required this.addressRUCtrl,
    required this.phoneCtrl,
    required this.phone2Ctrl,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
    this.shopID,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController addressTMCtrl;
  final TextEditingController addressRUCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController phone2Ctrl;
  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

  final String? shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        String shopImagePath = await ref.read(shopImagePathProvider);
        if (formKey.currentState?.validate() == true &&
            shopImagePath.isNotEmpty) {
          ShopParams? params;
          ref.read(loadCreateShopProvider.notifier).state = true;
          ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);
          bool hasShipping = await ref.read(hasShippingProvider);

          final shop = Shop(
            id: shopID,
            nameTM: nameTMCtrl.text,
            nameRU: nameRUCtrl.text,
            addressTM: addressTMCtrl.text,
            addressRU: addressRUCtrl.text,
            latitude: double.parse(latitudeCtrl.text),
            longitude: double.parse(longitudeCtrl.text),
            image: shopImagePath,
            shopOwnerID: shopOwner.id,
            phones: phone2Ctrl.text.isNotEmpty
                ? ["+993${phoneCtrl.text}", "+993${phone2Ctrl.text}"]
                : ["+993${phoneCtrl.text}"],
            hasShipping: hasShipping,
          );

          if (context.mounted) {
            params = ShopParams(shop: shop, context: context);
          }
          ResultShop resultShop = shopID == null
              ? await ref.watch(createShopProvider(params!).future)
              : await ref.watch(updateShopProvider(params!).future);

          ref.read(loadCreateShopProvider.notifier).state = false;

          if (resultShop.error == '') {
            ref.invalidate(fetchShopsProvider);
            if (context.mounted) {
              showSuccess(context);
              Navigator.pop(context);
            }
          }
        }
      },
      child: Text(lang.add),
    );
  }
}
