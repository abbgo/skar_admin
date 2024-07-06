import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/brends/parts/result_brends.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/providers/pages/brend.dart';

class BrendsPage extends StatelessWidget {
  const BrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              label: AppLocalizations.of(context)!.searchBrand,
              onSubmitted: (value) {
                ref.read(brendSearchProvider.notifier).state = value;
                ref.read(hasBrendProvider.notifier).state = true;
              },
            );
          },
        ),
      ),
      body: const ResultBrends(),
    );
  }
}
