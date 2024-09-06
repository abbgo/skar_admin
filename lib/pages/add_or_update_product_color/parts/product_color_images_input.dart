import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/selected_images.dart';

class ProductColorImagesInput extends StatelessWidget {
  const ProductColorImagesInput({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${lang.addProductColorImages}: *',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  showSelectedImageSheet(context, 'product', 3, 4);
                },
                icon: const Column(
                  children: [
                    Icon(Icons.add_photo_alternate, size: 100),
                    Text('3 : 4'),
                  ],
                ),
              ),
              const SelectedImages(),
            ],
          ),
        ],
      ),
    );
  }
}
