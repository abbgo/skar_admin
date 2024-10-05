import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/pages/products/parts/add_product_button.dart';
import 'package:skar_admin/pages/products/parts/count_of_products.dart';
import 'package:skar_admin/pages/products/parts/products_page_scroll_button.dart';
import 'package:skar_admin/pages/products/parts/result_products.dart';
import 'package:skar_admin/pages/products/parts/search_product_input.dart';
import 'package:skar_admin/providers/pages/products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, this.shopID});

  final String? shopID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchProductInput(),
        centerTitle: false,
        actions: shopID != null
            ? [
                AddProductButton(shopID: shopID!),
              ]
            : [],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          bool loadDeleteProduct = ref.watch(loadDeleteProductProvider);

          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountOfProducts(shopID: shopID),
                  ResultProducts(shopID: shopID),
                ],
              ),
              loadDeleteProduct ? loadProcess : const SizedBox(),
            ],
          );
        },
      ),
      floatingActionButton: const ProductsPageScrollButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
