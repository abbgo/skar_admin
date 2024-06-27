import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/pages/add_shop.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

class ShopImageInput extends ConsumerWidget {
  const ShopImageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File? selectedImage = ref.watch(shopImageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dukanyn suratyny saylan *'),
        Row(
          children: [
            IconButton(
              onPressed: () => showSelectedImageSheet(context),
              icon: const Icon(Icons.add_photo_alternate),
            ),
            selectedImage == null
                ? const Text('Surat yok')
                : Image(
                    image: FileImage(selectedImage),
                    height: 50,
                    width: 50,
                  ),
          ],
        ),
      ],
    );
  }
}
