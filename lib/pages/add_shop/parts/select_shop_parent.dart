import 'package:flutter/material.dart';

class SelectShopParent extends StatelessWidget {
  const SelectShopParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eger dukanynyz sowda merkezine degisli bolsa sowda merkezi saylan !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sowda merkezi saylan'),
            ),
          )
        ],
      ),
    );
  }
}
