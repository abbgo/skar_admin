import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/category.dart';

class AddOrUpdateProductButton extends ConsumerWidget {
  const AddOrUpdateProductButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.priceCtrl,
    required this.oldPriceCtrl,
    required this.shopID,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController oldPriceCtrl;

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () async {
        List<Category> selectedCategories =
            ref.read(selectedCategoriesProvider);

        List<ProductColor> productColors = ref.read(productColorsProvider);

        if (formKey.currentState?.validate() == true &&
            selectedCategories.isNotEmpty &&
            productColors.isNotEmpty) {
          return;
        }

        if (context.mounted) showEnterInformationWarning(context);
      },
      child: Text(lang.add),
    );
  }
}
