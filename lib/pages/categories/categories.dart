import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/result_categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key, required this.childCategories});

  final List<Category> childCategories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(lang.selectCategories), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ResultCategories(childCategories: childCategories),
      ),
    );
  }
}
