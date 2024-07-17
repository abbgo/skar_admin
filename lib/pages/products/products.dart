import 'package:flutter/material.dart';
import 'package:skar_admin/pages/products/parts/add_or_update_product_button.dart';
import 'package:skar_admin/pages/products/parts/count_of_products.dart';
import 'package:skar_admin/pages/products/parts/products_page_scroll_button.dart';
import 'package:skar_admin/pages/products/parts/result_products.dart';
import 'package:skar_admin/pages/products/parts/search_product_input.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchProductInput(),
        centerTitle: false,
        actions: [
          AddOrUpdateProductActionButton(shopID: shopID),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CountOfProducts(shopID: shopID),
          ResultProducts(shopID: shopID),
        ],
      ),
      floatingActionButton: const ProductsPageScrollButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
