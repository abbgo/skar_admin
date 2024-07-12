import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/category.dart';

class ShowSelectedCategories extends ConsumerWidget {
  const ShowSelectedCategories({super.key, this.oldCategories});

  final List<Category>? oldCategories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget showWidget;
    List<Category> selectedCategories = ref.watch(selectedCategoriesProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    if (selectedCategories.isEmpty && oldCategories == null) {
      showWidget = const SizedBox();
    } else if (selectedCategories.isNotEmpty) {
      showWidget = showcategoriesMethod(selectedCategories, isTM);
    } else {
      showWidget = showcategoriesMethod(oldCategories!, isTM);
    }

    return showWidget;
  }

  ListView showcategoriesMethod(List<Category> selectedCategories, bool isTM) {
    return ListView.builder(
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
    );
  }
}
