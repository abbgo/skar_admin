import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/add_or_update_product_button.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/add_product_color.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/product_name_ru_input.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/product_name_tm_input.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/product_old_price_input.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/product_price_input.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/select_product_brend.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/select_product_categories.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/visibility_input.dart';
import 'package:skar_admin/pages/parts/cancel_button.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class AddOrUpdateProductPageBody extends StatelessWidget {
  const AddOrUpdateProductPageBody({
    super.key,
    required this.productFormKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.priceCtrl,
    required this.oldPriceCtrl,
    required this.shopID,
    this.oldBrend,
  });

  final GlobalKey<FormState> productFormKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController oldPriceCtrl;

  final String shopID;
  final Brend? oldBrend;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Form(
            key: productFormKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ProductNameTmInput(ctrl: nameTMCtrl),
                ProductNameRuInput(ctrl: nameRUCtrl),
                Row(
                  children: [
                    ProductPriceInput(ctrl: priceCtrl),
                    const SizedBox(width: 20),
                    ProductOldPriceInput(ctrl: oldPriceCtrl),
                  ],
                ),
                SelectProductBrend(oldBrend: oldBrend),
                const SelectProductCategories(),
                const VisibilityInput(),
                const AddProductColor(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CancelButton(),
                      AddOrUpdateProductButton(
                        formKey: productFormKey,
                        nameTMCtrl: nameTMCtrl,
                        nameRUCtrl: nameRUCtrl,
                        priceCtrl: priceCtrl,
                        oldPriceCtrl: oldPriceCtrl,
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
            bool loadCreateProduct = ref.watch(loadCreateProductProvider);
            return loadCreateProduct ? loadProcess : const SizedBox();
          },
        ),
      ],
    );
  }
}
