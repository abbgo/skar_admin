import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () async {
        List<ProductColor> productColors = [];

        List<Dimension> selectedDimensions =
            await ref.read(selectedDimensionsProvider);

        List<SelectedImage> selectedImages =
            await ref.read(productImagesProvider);

        if (formKey.currentState?.validate() == true &&
            selectedDimensions.isNotEmpty &&
            selectedImages.isNotEmpty) {
          return;
        }

        if (context.mounted) showEnterInformationWarning(context);
      },
      child: const Text('Haryt gornusini gos'),
    );
  }
}
