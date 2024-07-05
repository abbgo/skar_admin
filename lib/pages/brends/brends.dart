import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrendsPage extends StatelessWidget {
  const BrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchInput(label: AppLocalizations.of(context)!.searchBrand),
      ),
    );
  }
}
