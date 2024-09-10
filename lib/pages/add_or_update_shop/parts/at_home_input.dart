import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/at_home_input_button.dart';

class AtHomeInput extends ConsumerWidget {
  const AtHomeInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            '${lang.doYouSellThisStoreProductsInYourHome} : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          AtHomeInputButton(text: lang.yes),
          AtHomeInputButton(text: lang.no),
        ],
      ),
    );
  }
}
