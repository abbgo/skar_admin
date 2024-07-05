import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateProduct extends StatefulWidget {
  const AddOrUpdateProduct({super.key, required this.shopID});

  final String shopID;

  @override
  State<AddOrUpdateProduct> createState() => _AddOrUpdateProductState();
}

class _AddOrUpdateProductState extends State<AddOrUpdateProduct> {
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
      body: const Center(child: Text('Add or Update Product')),
    );
  }
}
