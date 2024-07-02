import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/shop_parents/parts/result_shop_parents.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:skar_admin/providers/api/shop.dart';

class ShopParentsPage extends StatelessWidget {
  const ShopParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              onSubmitted: (value) {
                ref.read(shopSearchProvider.notifier).state = value;
                ref.read(hasShopsProvider.notifier).state = true;
              },
            );
          },
        ),
      ),
      body: const ResultShopParents(),
    );
  }
}
