import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/result_categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:skar_admin/providers/pages/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.childCategories});

  final List<Category> childCategories;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              label: lang.searchCategory,
              onSubmitted: (value) {
                ref.read(categorySearchProvider.notifier).state = value;
                ref.read(hasCategoriesProvider.notifier).state = true;
              },
            );
          },
        ),
        centerTitle: false,
      ),
      body: ResultCategories(childCategories: childCategories),
    );
  }
}
