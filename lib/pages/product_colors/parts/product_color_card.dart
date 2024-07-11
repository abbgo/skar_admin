import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/product_colors/parts/selected_dimensions.dart';
import 'package:skar_admin/pages/product_colors/parts/selected_product_color_images.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductColorCard extends StatelessWidget {
  const ProductColorCard({super.key, required this.productColor});

  final ProductColor productColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ExpansionTile(
          collapsedBackgroundColor: elevatedButtonColor,
          collapsedTextColor: Colors.white,
          title: Text(productColor.name),
          children: [
            const Text('Saylanan olcegler: '),
            SelectedDimensions(
              selectedDimensions: productColor.selectedDimensions,
            ),
            const Text('Saylanan suratlar: '),
            SelectedProductColorImages(
              selectedImages: productColor.selectedImages,
            ),
          ],
        ),
      ),
    );
  }
}
