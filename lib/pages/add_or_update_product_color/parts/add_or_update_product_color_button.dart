import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddProductColorButton extends ConsumerWidget {
  const AddProductColorButton({
    super.key,
    required this.formKey,
    required this.nameCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () async {
        List<Dimension> selectedDimensions =
            await ref.read(selectedDimensionsProvider);

        List<ProductColorImage> images = await ref.read(productImagesProvider);

        if (formKey.currentState?.validate() == true &&
            selectedDimensions.isNotEmpty &&
            images.isNotEmpty) {
          List<ProductColor> productColors =
              await ref.read(productColorsProvider);

          List<String> dimensionIDs = [];
          for (Dimension dimension in selectedDimensions) {
            dimensionIDs.add(dimension.id);
          }

          ProductColor productColor = ProductColor(
            name: nameCtrl.text,
            orderNumber: productColors.length + 1,
            dimensions: dimensionIDs,
            images: images,
            selectedDimensions: selectedDimensions,
          );

          await ref
              .read(productColorsProvider.notifier)
              .addProductColor(productColor);

          if (context.mounted) Navigator.pop(context);
          return;
        }

        if (context.mounted) showEnterInformationWarning(context);
      },
      child: Text(lang.addProductType),
    );
  }
}
