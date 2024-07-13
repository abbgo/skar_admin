import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';
import 'package:skar_admin/models/image.dart';

class SelectedProductColorImages extends StatelessWidget {
  const SelectedProductColorImages({
    super.key,
    this.selectedImages,
    this.oldImages,
  });

  final List<SelectedImage>? selectedImages;
  final List<ProductColorImage>? oldImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: selectedImages != null
          ? GridView.builder(
              itemCount: selectedImages!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 20,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                return Image(
                  image: FileImage(selectedImages![index].image!),
                  height: 100,
                );
              },
            )
          : GridView.builder(
              itemCount: oldImages!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: showCachImageMethod(oldImages![index].image),
                );
              },
            ),
    );
  }
}
