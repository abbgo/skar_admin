import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';
import 'package:skar_admin/models/image.dart';

class SelectedProductColorImages extends StatelessWidget {
  const SelectedProductColorImages({super.key, this.images});

  final List<ProductColorImage>? images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: images!.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          mainAxisSpacing: 100,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 3 / 4,
            child: showCachImageMethod(images![index].image),
          );
        },
      ),
    );
  }
}
