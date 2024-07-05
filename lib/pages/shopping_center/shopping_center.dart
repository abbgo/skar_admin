import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/shopping_center/parts/result_shopping_centers.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';

class ShoppingCenterPage extends StatelessWidget {
  const ShoppingCenterPage({
    super.key,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
  });

  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              onSubmitted: (value) {
                ref.read(shoppingCenterSearchProvider.notifier).state = value;
                ref.read(hasShoppingCenterProvider.notifier).state = true;
              },
            );
          },
        ),
      ),
      body: ResultShoppingCenters(
        latitudeCtrl: latitudeCtrl,
        longitudeCtrl: longitudeCtrl,
      ),
    );
  }
}
