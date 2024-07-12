import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/add_or_update_product_page_body.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/services/api/product.dart';

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
      body: widget.productID == ''
          ? addOrUpdateProductPageBody(null, null)
          : Consumer(
              builder: (context, ref, child) {
                ProductParams params =
                    ProductParams(productID: widget.productID);
                final AsyncValue<ResultProduct> resultProduct =
                    ref.watch(fetchProductProvider(params));

                return resultProduct.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '' || response.product == null) {
                      return const NoResult();
                    }

                    Product product = response.product!;
                    nameTMCtrl.text = product.nameTM;
                    nameRUCtrl.text = product.nameRU;
                    priceCtrl.text = product.price.toString();
                    oldPriceCtrl.text = product.oldPrice.toString();

                    return addOrUpdateProductPageBody(
                      widget.productID,
                      product.categories,
                    );
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => loadWidget,
                );
              },
            ),
    );
  }

  AddOrUpdateProductPageBody addOrUpdateProductPageBody(
    String? productID,
    List<Category>? oldCategories,
  ) {
    return AddOrUpdateProductPageBody(
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
      productFormKey: productFormKey,
      priceCtrl: priceCtrl,
      oldPriceCtrl: oldPriceCtrl,
      shopID: widget.shopID,
      oldCategories: oldCategories,
    );
  }
}
