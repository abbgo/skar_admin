import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/categories.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class CategoryBasicListTile extends ConsumerWidget {
  const CategoryBasicListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';

    return ListTile(
      title: Text(isTM ? category.nameTM : category.nameRU),
      trailing: IconButton(
        onPressed: () => goToPage(
          context,
          CategoriesPage(childCategories: category.childCategories!),
          false,
        ),
        icon: Icon(Icons.adaptive.arrow_forward),
      ),
    );
  }
}
