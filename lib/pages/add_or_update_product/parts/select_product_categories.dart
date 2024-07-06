import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/categories/categories.dart';

class SelectProductCategories extends StatelessWidget {
  const SelectProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${lang.enterTheCategoriesOfProduct} : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => goToPage(context, const CategoriesPage(), false),
              child: Text(lang.selectCategories),
            ),
          )
        ],
      ),
    );
  }
}
