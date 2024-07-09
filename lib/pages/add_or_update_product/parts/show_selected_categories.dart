import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/pages/category.dart';

class ShowSelectedCategories extends ConsumerWidget {
  const ShowSelectedCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> selectedCategories = ref.watch(selectedCategoriesProvider);

    return selectedCategories.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: selectedCategories.length,
            itemBuilder: (context, index) {
              Category category = selectedCategories[index];
              return Text(category.nameTM);
            },
          )
        : const SizedBox();
  }
}
