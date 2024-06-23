import 'package:flutter/material.dart';

class AddShopButton extends StatelessWidget {
  const AddShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 5),
      onPressed: () {},
      child: const Text('Taze Dukan gos'),
    );
  }
}
