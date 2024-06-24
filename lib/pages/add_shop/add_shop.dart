import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_address_tm_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_name_ru_input.dart';
import 'package:skar_admin/pages/add_shop/parts/shop_name_tm_input.dart';

class AddShopPage extends StatefulWidget {
  const AddShopPage({super.key});

  @override
  State<AddShopPage> createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  final GlobalKey<FormState> addShopformKey = GlobalKey<FormState>();
  final TextEditingController nameTMCtrl = TextEditingController();
  final TextEditingController nameRUCtrl = TextEditingController();
  final TextEditingController addressTMCtrl = TextEditingController();

  @override
  void dispose() {
    nameTMCtrl.dispose();
    nameRUCtrl.dispose();
    addressTMCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.addShopInformation),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Form(
          key: addShopformKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ShopNameTmInput(ctrl: nameTMCtrl),
              ShopNameRuInput(ctrl: nameRUCtrl),
              ShopAddressTmInput(ctrl: addressTMCtrl),
            ],
          ),
        ),
      ),
    );
  }
}
