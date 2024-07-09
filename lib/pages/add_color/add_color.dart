import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';

class AddColorPage extends StatelessWidget {
  const AddColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const FloatingButton(
        page: AddOrUpdateShopPage(shopID: ''),
        text: 'Gosnus gos',
      ),
    );
  }
}
