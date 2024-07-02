import 'package:flutter/material.dart';
import 'package:skar_admin/pages/shop_parents/parts/result_shop_parents.dart';
import 'package:skar_admin/pages/shop_parents/parts/search_input.dart';

class ShopParentsPage extends StatelessWidget {
  const ShopParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchInput(),
      ),
      body: const ResultShopParents(),
    );
  }
}
