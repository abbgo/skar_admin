import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_product_color/add_product_color.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/product_colors/parts/product_colors_body.dart';

class ProductColorsPage extends StatelessWidget {
  const ProductColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text(lang.productTypes)),
      body: const ProductColorsBody(),
      floatingActionButton: FloatingButton(
        page: const AddProductColorPage(),
        text: lang.addProductType,
      ),
    );
  }
}
