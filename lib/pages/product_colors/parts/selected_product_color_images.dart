import 'package:flutter/material.dart';
import 'package:skar_admin/models/image.dart';

class SelectedProductColorImages extends StatelessWidget {
  const SelectedProductColorImages({super.key, required this.selectedImages});

  final List<SelectedImage> selectedImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: selectedImages.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 20,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          return Image(
            image: FileImage(selectedImages[index].image!),
            height: 100,
          );
        },
      ),
    );
  }
}
