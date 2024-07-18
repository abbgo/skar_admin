import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/products/products.dart';

class TrashedProducts extends StatelessWidget {
  const TrashedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => goToPage(context, const ProductsPage(), false),
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
