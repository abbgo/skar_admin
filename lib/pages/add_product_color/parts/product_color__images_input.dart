import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';

class ProductColorImagesInput extends ConsumerWidget {
  const ProductColorImagesInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    File? selectedImage = ref.watch(productImageProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

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
                    showSelectedImageSheet(context, 'product', 8, 16, true),
                icon: const Column(
                  children: [
                    Icon(Icons.add_photo_alternate, size: 100),
                    Text('8 : 16'),
                  ],
                ),
              ),
              Expanded(
                child: !loadSendImage
                    ? selectedImage == null
                        ? Text(lang.noImage, textAlign: TextAlign.center)
                        : Image(
                            image: FileImage(selectedImage),
                            height: 100,
                            width: 100,
                          )
                    : loadWidget,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
