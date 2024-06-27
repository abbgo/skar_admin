import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skar_admin/helpers/functions/file_upload.dart';

class SelectImageBottomSheet extends StatelessWidget {
  const SelectImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageSourcePart(
                icon: Icons.image,
                text: 'Galery',
                imageSource: ImageSource.gallery,
              ),
              ImageSourcePart(
                icon: Icons.camera,
                text: 'Camera',
                imageSource: ImageSource.camera,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageSourcePart extends ConsumerWidget {
  const ImageSourcePart({
    super.key,
    required this.icon,
    required this.text,
    required this.imageSource,
  });

  final IconData icon;
  final String text;
  final ImageSource imageSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: () async {
            await getImage(ref, imageSource);
            if (context.mounted) Navigator.pop(context);
          },
          icon: Icon(icon, size: 50),
        ),
        Text(text),
      ],
    );
  }
}
