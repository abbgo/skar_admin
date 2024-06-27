import 'package:flutter/material.dart';

class ShopImageInput extends StatelessWidget {
  const ShopImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dukanyn suratyny saylan'),
        Row(
          children: [
            Text('Surat saylan'),
            Text('Saylanan suraty gorkez'),
          ],
        ),
      ],
    );
  }
}
