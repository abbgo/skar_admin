import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/add_or_update_shop_page_body.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/services/api/shop.dart';

class AddOrUpdateShopPage extends ConsumerStatefulWidget {
  const AddOrUpdateShopPage({super.key, required this.shopID});

  final String shopID;

  @override
  // State<AddOrUpdateShopPage> createState() => _AddOrUpdateShopPageState();
  AddOrUpdateShopPageState createState() => AddOrUpdateShopPageState();
}

class AddOrUpdateShopPageState extends ConsumerState<AddOrUpdateShopPage> {
  final GlobalKey<FormState> addShopformKey = GlobalKey<FormState>();
  final TextEditingController nameTMCtrl = TextEditingController();
  final TextEditingController nameRUCtrl = TextEditingController();
  final TextEditingController addressTMCtrl = TextEditingController();
  final TextEditingController addressRUCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController phone2Ctrl = TextEditingController();
  final TextEditingController latitudeCtrl = TextEditingController();
  final TextEditingController longitudeCtrl = TextEditingController();

  Future<void> fetchShopByID(String shopID) async {
    ShopParams params = ShopParams(shopID: shopID);
    ResultShop resultShop = await ref.watch(fetchShopProvider(params).future);
    Shop shop = resultShop.shop!;

    nameTMCtrl.text = shop.nameTM;
    nameRUCtrl.text = shop.nameRU;
    addressTMCtrl.text = shop.addressTM!;
    addressRUCtrl.text = shop.addressRU!;
    phoneCtrl.text = shop.phones![0];
    phone2Ctrl.text = shop.phones![1];
    latitudeCtrl.text = shop.latitude!.toString();
    longitudeCtrl.text = shop.longitude!.toString();
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

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.addShopInformation),
      ),
      body: AddOrUpdateShopPageBody(
        addShopformKey: addShopformKey,
        nameTMCtrl: nameTMCtrl,
        nameRUCtrl: nameRUCtrl,
        addressTMCtrl: addressTMCtrl,
        addressRUCtrl: addressRUCtrl,
        phoneCtrl: phoneCtrl,
        phone2Ctrl: phone2Ctrl,
        latitudeCtrl: latitudeCtrl,
        longitudeCtrl: longitudeCtrl,
      ),
    );
  }
}
