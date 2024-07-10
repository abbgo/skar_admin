import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';

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
            '${lang.addImageOfTheShop}: *',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>
                    showSelectedImageSheet(context, 'product', 16, 8),
                icon: const Column(
                  children: [
                    Icon(Icons.add_photo_alternate, size: 100),
                    Text('16 : 8'),
                  ],
                ),
              ),
              Expanded(
                child: Text(lang.noImage, textAlign: TextAlign.center),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
