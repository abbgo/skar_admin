import 'package:flutter/material.dart';
import 'package:skar_admin/pages/trash/parts/trashed_products.dart';
import 'package:skar_admin/pages/trash/parts/trashed_shops.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        children: const [
          TrashedShops(),
          TrashedProducts(),
        ],
      ),
    );
  }
}
