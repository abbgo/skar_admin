import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectedImages extends ConsumerWidget {
  const SelectedImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    List<File?> selectedImages = ref.watch(productImagesProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

    return Expanded(
      child: !loadSendImage
          ? selectedImages.isEmpty
              ? Text(lang.noImage, textAlign: TextAlign.center)
              : GridView.builder(
                  itemCount: selectedImages.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 100,
                  ),
                  itemBuilder: (context, index) {
                    File? selectedImage = selectedImages[index];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: FileImage(selectedImage!), height: 100),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                )
          : loadWidget,
    );
  }
}
