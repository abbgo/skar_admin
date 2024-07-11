import 'package:flutter/material.dart';

class AddProductColorButton extends StatelessWidget {
  const AddProductColorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () {},
      child: const Text('Haryt gornusini gos'),
    );
  }
}
