import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skar_admin/helpers/functions/file_upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectImageBottomSheet extends StatelessWidget {
  const SelectImageBottomSheet({super.key, required this.imageType});

  final String imageType;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageSourcePart(
                icon: Icons.image,
                text: lang.galery,
                imageSource: ImageSource.gallery,
                imageType: imageType,
              ),
              ImageSourcePart(
                icon: Icons.camera,
                text: lang.camera,
                imageSource: ImageSource.camera,
                imageType: imageType,
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
    required this.imageType,
  });

  final IconData icon;
  final String text;
  final ImageSource imageSource;
  final String imageType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: () async {
            await getImage(ref, imageSource, imageType);
            if (context.mounted) Navigator.pop(context);
          },
          icon: Icon(icon, size: 50),
        ),
        Text(text),
      ],
    );
  }
}
