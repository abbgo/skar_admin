import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchProductInput extends ConsumerWidget {
  const SearchProductInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return SearchInput(
      label: lang.searchProduct,
      onSubmitted: (value) {
        ref.read(productSearchProvider.notifier).state = value;
        ref.read(hasProductsProvider.notifier).state = true;
      },
    );
  }
}
