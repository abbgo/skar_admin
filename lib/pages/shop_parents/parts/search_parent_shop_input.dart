import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/styles/colors.dart';

class SearchParentShopInput extends ConsumerWidget {
  const SearchParentShopInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      child: TextField(
        textInputAction: TextInputAction.search,
        cursorHeight: 15,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${AppLocalizations.of(context)!.findMall} ',
        ),
        onSubmitted: (value) {
          ref.read(shopSearchProvider.notifier).state = value;
          ref.read(hasShopsProvider.notifier).state = true;
        },
      ),
    );
  }
}
