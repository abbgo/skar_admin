import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopImageInput extends ConsumerWidget {
  const ShopImageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    File? selectedImage = ref.watch(shopImageProvider);
    bool isTrueImage = ref.watch(isTrueImageProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${lang.addImageOfTheShop}: *'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => showSelectedImageSheet(context, 'shop'),
              icon: const Column(
                children: [
                  Icon(Icons.add_photo_alternate, size: 100),
                  Text('1800 x 4000'),
                ],
              ),
            ),
            Expanded(
              child: !loadSendImage
                  ? !isTrueImage
                      ? Text(
                          lang.imageMustBeSpecifiedDimensions,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : selectedImage == null
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
    );
  }
}
