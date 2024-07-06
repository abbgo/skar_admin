import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/api/category.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ResultCategory> resultCategories =
        ref.watch(fetchCategoriesProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: resultCategories.when(
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          skipError: true,
          data: (response) {
            if (response.error != '') {
              return null;
            }

            List<Category> categories = response.categories!;
            return ListView.builder(
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(child: Text(categories[index].nameTM));
              },
            );
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => null,
        ),
      ),
    );
  }
}
