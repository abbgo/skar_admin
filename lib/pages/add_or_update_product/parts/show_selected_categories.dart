import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/category.dart';

class ShowSelectedCategories extends ConsumerWidget {
  const ShowSelectedCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> selectedCategories = ref.watch(selectedCategoriesProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    return selectedCategories.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: selectedCategories.length,
            itemBuilder: (context, index) {
              Category category = selectedCategories[index];
              return Text(
                isTM
                    ? '${index + 1}. ${category.nameTM}'
                    : '${index + 1}. ${category.nameRU}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          )
        : const SizedBox();
  }
}
