import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/add_or_update_product_page_body.dart';

class AddOrUpdateProductPage extends StatefulWidget {
  const AddOrUpdateProductPage({
    super.key,
    required this.shopID,
    required this.productID,
  });

  final String shopID;
  final String productID;

  @override
  State<AddOrUpdateProductPage> createState() => _AddOrUpdateProductPageState();
}

class _AddOrUpdateProductPageState extends State<AddOrUpdateProductPage> {
  final GlobalKey<FormState> productFormKey = GlobalKey<FormState>();
  final TextEditingController nameTMCtrl = TextEditingController();
  final TextEditingController nameRUCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController oldPriceCtrl = TextEditingController();

  @override
  void dispose() {
    nameTMCtrl.dispose();
    nameRUCtrl.dispose();
    priceCtrl.dispose();
    oldPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.addProductInformation),
      ),
      body: addOrUpdateProductPageBody(null),
    );
  }

  AddOrUpdateProductPageBody addOrUpdateProductPageBody(String? productID) {
    return AddOrUpdateProductPageBody(
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
      productFormKey: productFormKey,
      priceCtrl: priceCtrl,
      oldPriceCtrl: oldPriceCtrl,
      shopID: widget.shopID,
    );
  }
}
