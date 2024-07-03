import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/add_or_update_shop_page_body.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/services/api/shop.dart';

class AddOrUpdateShopPage extends StatefulWidget {
  const AddOrUpdateShopPage({super.key, required this.shopID});

  final String shopID;

  @override
  State<AddOrUpdateShopPage> createState() => _AddOrUpdateShopPageState();
}

class _AddOrUpdateShopPageState extends State<AddOrUpdateShopPage> {
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
      body: widget.shopID == ''
          ? addOrUpdateShopPageBody(null)
          : Consumer(
              builder: (context, ref, child) {
                ShopParams params = ShopParams(shopID: widget.shopID);
                final AsyncValue<ResultShop> resultShop =
                    ref.watch(fetchShopProvider(params));

                return resultShop.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '' || response.shop == null) {
                      return const NoResult();
                    }

                    Shop shop = response.shop!;
                    nameTMCtrl.text = shop.nameTM;
                    nameRUCtrl.text = shop.nameRU;
                    addressTMCtrl.text = shop.addressTM!;
                    addressRUCtrl.text = shop.addressRU!;
                    phoneCtrl.text =
                        shop.phones![0].substring(shop.phones![0].length - 8);
                    if (shop.phones!.length > 1) {
                      phone2Ctrl.text =
                          shop.phones![1].substring(shop.phones![1].length - 8);
                    }
                    latitudeCtrl.text = shop.latitude!.toString();
                    longitudeCtrl.text = shop.longitude!.toString();

                    return addOrUpdateShopPageBody(shop.image);
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => loadWidget,
                );
              },
            ),
    );
  }

  AddOrUpdateShopPageBody addOrUpdateShopPageBody(String? oldImage) {
    return AddOrUpdateShopPageBody(
      addShopformKey: addShopformKey,
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
      addressTMCtrl: addressTMCtrl,
      addressRUCtrl: addressRUCtrl,
      phoneCtrl: phoneCtrl,
      phone2Ctrl: phone2Ctrl,
      latitudeCtrl: latitudeCtrl,
      longitudeCtrl: longitudeCtrl,
      oldImage: oldImage,
    );
  }
}
