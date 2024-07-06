import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              label: AppLocalizations.of(context)!.searchCategory,
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Categories'),
      ),
    );
  }
}
