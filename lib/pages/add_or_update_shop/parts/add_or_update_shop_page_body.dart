import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/add_or_update_shop_button.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/has_shipping_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/select_shop_parent.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_address_ru_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_address_tm_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_coordinates_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_image_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_name_ru_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_name_tm_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_phone_2_input.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/shop_phone_input.dart';
import 'package:skar_admin/pages/parts/cancel_button.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

class AddOrUpdateShopPageBody extends StatelessWidget {
  const AddOrUpdateShopPageBody({
    super.key,
    required this.addShopformKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.addressTMCtrl,
    required this.addressRUCtrl,
    required this.phoneCtrl,
    required this.phone2Ctrl,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
    this.oldImage,
    this.shopID,
  });

  final GlobalKey<FormState> addShopformKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController addressTMCtrl;
  final TextEditingController addressRUCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController phone2Ctrl;
  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

  final String? oldImage;
  final String? shopID;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Form(
            key: addShopformKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ShopNameTmInput(ctrl: nameTMCtrl),
                ShopNameRuInput(ctrl: nameRUCtrl),
                ShopAddressTmInput(ctrl: addressTMCtrl),
                ShopAddressRuInput(ctrl: addressRUCtrl),
                ShopPhoneInput(ctrl: phoneCtrl),
                ShopPhone2Input(ctrl: phone2Ctrl),
                SelectShopParent(
                  latitudeCtrl: latitudeCtrl,
                  longitudeCtrl: longitudeCtrl,
                ),
                ShopCoordinatesInput(
                  latitudeCtrl: latitudeCtrl,
                  longitudeCtrl: longitudeCtrl,
                ),
                const HasShippingInput(),
                ShopImageInput(oldImage: oldImage),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CancelButton(),
                      AddOrUpdateShopButton(
                        formKey: addShopformKey,
                        nameTMCtrl: nameTMCtrl,
                        nameRUCtrl: nameRUCtrl,
                        addressTMCtrl: addressTMCtrl,
                        addressRUCtrl: addressRUCtrl,
                        phoneCtrl: phoneCtrl,
                        phone2Ctrl: phone2Ctrl,
                        latitudeCtrl: latitudeCtrl,
                        longitudeCtrl: longitudeCtrl,
                        shopID: shopID,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            bool loadCreateShop = ref.watch(loadCreateShopProvider);
            return loadCreateShop ? loadProcess : const SizedBox();
          },
        ),
      ],
    );
  }
}
