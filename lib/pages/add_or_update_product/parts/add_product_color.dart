import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/product_colors/product_colors.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class AddProductColor extends StatelessWidget {
  const AddProductColor({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${lang.addProductColors} * : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Consumer(
            builder: (context, ref, child) {
              List<ProductColor> productColors =
                  ref.watch(productColorsProvider);

              return Text(
                '${lang.countProductTypes}: ${productColors.length}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                goToPage(context, const ProductColorsPage(), false);
              },
              child: Text(lang.addProductTypes),
            ),
          ),
        ],
      ),
    );
  }
}
