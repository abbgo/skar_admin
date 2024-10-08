import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/providers/api/image.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/services/api/image.dart';

class SelectedImages extends ConsumerWidget {
  const SelectedImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    List<ProductColorImage> selectedImages = ref.watch(productImagesProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

    return Expanded(
      child: !loadSendImage
          ? selectedImages.isEmpty
              ? Text(lang.noImage, textAlign: TextAlign.center)
              : ReorderableListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductColorImage selectedImage = selectedImages[index];
                    return Card(
                      key: Key(selectedImage.image),
                      child: ListTile(
                        title: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: showCachImageMethod(selectedImage.image),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            ImageParams params = ImageParams(
                              oldImage: selectedImage.image,
                              context: context,
                            );
                            await ref.watch(deleteImageProvider(params).future);
                            await ref
                                .read(productImagesProvider.notifier)
                                .removeImage(selectedImage);
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: selectedImages.length,
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final ProductColorImage item =
                        selectedImages.removeAt(oldIndex);
                    selectedImages.insert(newIndex, item);
                  },
                )
          : loadWidget,
    );
  }
}
