import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateProductColorButton extends ConsumerWidget {
  const AddOrUpdateProductColorButton({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    this.oldProductColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;

  final ProductColor? oldProductColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: oldProductColor != null ? null : Colors.green,
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
            orderNumber: oldProductColor != null
                ? oldProductColor!.orderNumber
                : productColors.length + 1,
            dimensions: dimensionIDs,
            images: images,
            selectedDimensions: selectedDimensions,
          );

          if (oldProductColor != null) {
            await ref
                .read(productColorsProvider.notifier)
                .changeProductColor(productColor);
          } else {
            await ref
                .read(productColorsProvider.notifier)
                .addProductColor(productColor);
          }

          if (context.mounted) Navigator.pop(context);
          return;
        }

        if (context.mounted) showEnterInformationWarning(context);
      },
      child: Text(
        oldProductColor != null ? lang.changeProductType : lang.addProductType,
      ),
    );
  }
}
