import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddShopPage extends StatelessWidget {
  const AddShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.addShopInformation),
      ),
      body: const Center(
        child: Text('Add new shop page'),
      ),
    );
  }
}
