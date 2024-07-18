import 'package:flutter/material.dart';
import 'package:skar_admin/pages/trash/parts/trashed_products.dart';
import 'package:skar_admin/pages/trash/parts/trashed_shops.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        TrashedShops(),
        TrashedProducts(),
      ],
    );
  }
}
