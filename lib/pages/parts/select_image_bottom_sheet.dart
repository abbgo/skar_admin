import 'package:flutter/material.dart';

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
              ImageSourcePart(icon: Icons.image, text: 'Galery'),
              ImageSourcePart(icon: Icons.camera, text: 'Camera'),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageSourcePart extends StatelessWidget {
  const ImageSourcePart({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 50),
        ),
        Text(text),
      ],
    );
  }
}
