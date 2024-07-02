import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/styles/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, this.onSubmitted});

  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5, left: 20),
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${AppLocalizations.of(context)!.findMall} ',
        ),
        onSubmitted: onSubmitted,
        // onSubmitted: (value) {
        //   ref.read(shopSearchProvider.notifier).state = value;
        //   ref.read(hasShopsProvider.notifier).state = true;
        // },
      ),
    );
  }
}
