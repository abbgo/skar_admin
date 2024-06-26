import 'package:flutter/material.dart';

class HasDeliveryInput extends StatelessWidget {
  const HasDeliveryInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Eltip bermek hyzmaty bar: '),
        Switch.adaptive(
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
