import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrashedShops extends StatelessWidget {
  const TrashedShops({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.storefront_rounded, size: 50),
            const SizedBox(height: 10),
            Text(lang.trashShops),
          ],
        ),
      ),
    );
  }
}
