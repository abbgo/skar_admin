import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrashedProducts extends StatelessWidget {
  const TrashedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return GestureDetector(
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_mall, size: 50),
              const SizedBox(height: 10),
              Text(lang.trashProducts),
            ],
          ),
        ),
      ),
    );
  }
}
