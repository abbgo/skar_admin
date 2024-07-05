import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, this.onSubmitted, required this.label});

  final void Function(String)? onSubmitted;
  final String label;

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
          labelText: ' $label ',
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
