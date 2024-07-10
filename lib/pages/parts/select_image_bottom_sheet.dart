import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/functions/file_upload.dart';

class SelectImageBottomSheet extends StatelessWidget {
  const SelectImageBottomSheet({
    super.key,
    required this.imageType,
    required this.ratioX,
    required this.ratioY,
  });

  final String imageType;
  final double ratioX;
  final double ratioY;

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
          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageSourcePart(
                    icon: Icons.image,
                    text: lang.galery,
                    imageType: imageType,
                    getImageFunction: () => getImageFromFolder(
                      ref,
                      imageType,
                      context,
                      ratioX,
                      ratioY,
                    ),
                  ),
                  ImageSourcePart(
                    icon: Icons.camera,
                    text: lang.camera,
                    imageType: imageType,
                    getImageFunction: () => getImageFromCamera(
                      ref,
                      imageType,
                      context,
                      ratioX,
                      ratioY,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ImageSourcePart extends StatelessWidget {
  const ImageSourcePart({
    super.key,
    required this.icon,
    required this.text,
    required this.imageType,
    required this.getImageFunction,
  });

  final IconData icon;
  final String text;
  final String imageType;
  final Future<void> Function() getImageFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () async {
            await getImageFunction();
            if (context.mounted) Navigator.pop(context);
          },
          icon: Icon(icon, size: 50),
        ),
        Text(text),
      ],
    );
  }
}
