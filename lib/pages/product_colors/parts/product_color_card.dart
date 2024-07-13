import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/product_colors/parts/selected_dimensions.dart';
import 'package:skar_admin/pages/product_colors/parts/selected_product_color_images.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductColorCard extends StatelessWidget {
  const ProductColorCard({super.key, required this.productColor});

  final ProductColor productColor;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ExpansionTile(
          collapsedIconColor: Colors.white,
          collapsedBackgroundColor: elevatedButtonColor,
          collapsedTextColor: Colors.white,
          title: Text(productColor.name),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TtitleWidget(text: lang.selectedDimensions),
            SelectedDimensions(dimensions: productColor.selectedDimensions!),
            const Divider(),
            TtitleWidget(text: lang.selectedImages),
            SelectedProductColorImages(
              selectedImages: productColor.selectedImages!,
            ),
          ],
        ),
      ),
    );
  }
}

class TtitleWidget extends StatelessWidget {
  const TtitleWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child:
          Text('$text :', style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
