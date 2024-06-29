import 'dart:io';

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

class AddShopButton extends ConsumerWidget {
  const AddShopButton({
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        File? selectedImage = ref.read(shopImageProvider);
        if (formKey.currentState?.validate() == true && selectedImage != null) {
          ref.read(loadCreateShopProvider.notifier).state = true;
          ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);
          bool hasShipping = ref.read(hasShippingProvider);
          String shopImagePath = ref.read(shopImagePathProvider);

          final shop = Shop(
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

          // 37.949975, 58.378754

          ShopParams params = ShopParams(shop: shop);
          ResultShop resultShop =
              await ref.watch(createShopProvider(params).future);

          if (resultShop.error == '') {
            if (context.mounted) showSuccess(context);
          }
          ref.read(loadCreateShopProvider.notifier).state = false;
        }
      },
      child: Text(lang.add),
    );
  }
}
