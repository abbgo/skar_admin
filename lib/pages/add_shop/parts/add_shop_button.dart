import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

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
          bool hasDelivery = ref.read(hasDeliveryProvider);
          String shopImagePath = ref.read(shopImagePathProvider);

          final shop = Shop(
            nameTM: nameTMCtrl.text,
            nameRU: nameRUCtrl.text,
            addressTM: addressTMCtrl.text,
            addressRU: nameRUCtrl.text,
            latitude: double.parse(latitudeCtrl.text),
            longitude: double.parse(longitudeCtrl.text),
            image: shopImagePath,
            shopOwnerID: "33b9397c-fae9-4697-93b0-9a8abe11ee6a",
            phones: ["+99362420377", "+99362587412"],
          );
        }
      },
      child: Text(lang.add),
    );
  }
}
