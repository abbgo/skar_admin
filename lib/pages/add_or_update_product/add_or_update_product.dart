import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateProductPage extends StatefulWidget {
  const AddOrUpdateProductPage({super.key, required this.shopID});

  final String shopID;

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
      body: const Center(child: Text('Add or Update Product')),
    );
  }
}
