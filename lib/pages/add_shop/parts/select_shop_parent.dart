import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/shop_parents/shop_parents.dart';

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
              onPressed: () =>
                  goToPage(context, const ShopParentsPage(), false),
              child: const Text('Sowda merkezi saylan'),
            ),
          )
        ],
      ),
    );
  }
}
