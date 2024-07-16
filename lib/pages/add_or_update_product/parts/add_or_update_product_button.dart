import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/brend.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';

class AddOrUpdateProductButton extends ConsumerWidget {
  const AddOrUpdateProductButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.priceCtrl,
    required this.oldPriceCtrl,
    required this.shopID,
    required this.productID,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController oldPriceCtrl;

  final String shopID;
  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: productID != '' ? null : Colors.green,
      ),
      onPressed: () async {
        List<Category> selectedCategories =
            await ref.read(selectedCategoriesProvider);

        List<ProductColor> productColors =
            await ref.read(productColorsProvider);

        if (formKey.currentState?.validate() == true &&
            selectedCategories.isNotEmpty &&
            productColors.isNotEmpty) {
          ProductParams? params;
          ref.read(loadCreateProductProvider.notifier).state = true;
          bool isVisible = await ref.read(visibleProductProvider);
          Brend brend = ref.read(selectedBrendProvider);

          List<String> categoryIDs = [];
          for (var category in selectedCategories) {
            categoryIDs.add(category.id);
          }

          final product = Product(
            nameTM: nameTMCtrl.text,
            nameRU: nameRUCtrl.text,
            price: num.parse(priceCtrl.text),
            oldPrice: oldPriceCtrl.text.isNotEmpty
                ? num.parse(oldPriceCtrl.text)
                : 0.0,
            shopID: shopID,
            brendID: brend.id == '' ? null : brend.id,
            isVisible: isVisible,
            categoryIDs: categoryIDs,
            productColors: productColors,
          );

          if (context.mounted) {
            params = ProductParams(product: product, context: context);
          }

          ResultProduct resultProduct =
              await ref.watch(createProductProvider(params!).future);

          ref.read(loadCreateProductProvider.notifier).state = false;

          if (resultProduct.error == '') {
            ref.invalidate(hasProductsProvider);
            if (context.mounted) {
              showSuccess(context, lang.informationCreatedSuccessfully);
              Navigator.pop(context);
            }
          }
          return;
        }

        if (context.mounted) showEnterInformationWarning(context);
      },
      child: Text(productID != '' ? lang.change : lang.add),
    );
  }
}
