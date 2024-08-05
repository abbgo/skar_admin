import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/shops/shops.dart';
import 'package:skar_admin/styles/colors.dart';

class TrashedShops extends StatelessWidget {
  const TrashedShops({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => goToPage(context, const ShopsPage(isDeleted: true), false),
      child: Card(
        elevation: 6,
        color: elevatedButtonColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.storefront, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                lang.trashShops,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
