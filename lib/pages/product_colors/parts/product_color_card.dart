import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/parts/dimension_button.dart';
import 'package:skar_admin/pages/product_colors/parts/selected_dimensions.dart';
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 40,
                ),
                itemCount: productColor.dimensions.length,
                itemBuilder: (context, index) => DimensionButton(
                  d: productColor.selectedDimensions[index],
                  forOnlyShow: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
