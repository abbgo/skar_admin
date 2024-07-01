import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/pages/add_shop/parts/has_shipping_input.dart';
import 'package:skar_admin/pages/add_shop/parts/select_shop_parent.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_address_ru_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_address_tm_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_coordinates_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_image_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_name_ru_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_name_tm_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_phone_2_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_phone_input.dart';
import 'package:skar_admin/pages/add_shop/parts/add_shop_button.dart';
import 'package:skar_admin/pages/parts/cancel_button.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

class AddShopPage extends ConsumerStatefulWidget {
  const AddShopPage({super.key, required this.forUpdateShop});

  final bool forUpdateShop;

  @override
  // State<AddShopPage> createState() => _AddShopPageState();
  AddShopPageState createState() => AddShopPageState();
}

class AddShopPageState extends ConsumerState<AddShopPage> {
  final GlobalKey<FormState> addShopformKey = GlobalKey<FormState>();
  final TextEditingController nameTMCtrl = TextEditingController();
  final TextEditingController nameRUCtrl = TextEditingController();
  final TextEditingController addressTMCtrl = TextEditingController();
  final TextEditingController addressRUCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController phone2Ctrl = TextEditingController();
  final TextEditingController latitudeCtrl = TextEditingController();
  final TextEditingController longitudeCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameTMCtrl.dispose();
    nameRUCtrl.dispose();
    addressTMCtrl.dispose();
    addressRUCtrl.dispose();
    phoneCtrl.dispose();
    phone2Ctrl.dispose();
    latitudeCtrl.dispose();
    longitudeCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    bool loadCreateShop = ref.watch(loadCreateShopProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.addShopInformation),
      ),
      body: Stack(
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
                  const SelectShopParent(),
                  ShopCoordinatesInput(
                    latitudeCtrl: latitudeCtrl,
                    longitudeCtrl: longitudeCtrl,
                  ),
                  const HasShippingInput(),
                  const ShopImageInput(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CancelButton(),
                        AddShopButton(
                          formKey: addShopformKey,
                          nameTMCtrl: nameTMCtrl,
                          nameRUCtrl: nameRUCtrl,
                          addressTMCtrl: addressTMCtrl,
                          addressRUCtrl: addressRUCtrl,
                          phoneCtrl: phoneCtrl,
                          phone2Ctrl: phone2Ctrl,
                          latitudeCtrl: latitudeCtrl,
                          longitudeCtrl: longitudeCtrl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          loadCreateShop ? loadProcess : const SizedBox(),
        ],
      ),
    );
  }
}
