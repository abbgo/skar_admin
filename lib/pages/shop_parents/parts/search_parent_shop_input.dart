import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/styles/colors.dart';

class SearchParentShopInput extends ConsumerWidget {
  const SearchParentShopInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      child: TextField(
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' Sowda merkezi gozle ',
        ),
        onSubmitted: (value) {
          ref.read(shopSearchProvider.notifier).state = value;
          ref.read(hasShopsProvider.notifier).state = true;
        },
      ),
    );
  }
}
