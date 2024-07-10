import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/providers/pages/add_or_update_shop.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopImageInput extends ConsumerWidget {
  const ShopImageInput({super.key, this.oldImage});

  final String? oldImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    File? selectedImage = ref.watch(shopImageProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                    showSelectedImageSheet(context, 'shop', 3, 2, false),
                icon: const Column(
                  children: [
                    Icon(Icons.add_photo_alternate, size: 100),
                    Text('3 : 2'),
                  ],
                ),
              ),
              Expanded(
                child: !loadSendImage
                    ? selectedImage == null
                        ? oldImage == null
                            ? Text(lang.noImage, textAlign: TextAlign.center)
                            : SizedBox(
                                height: 100,
                                width: 100,
                                child: showCachImageMethod(oldImage!),
                              )
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
