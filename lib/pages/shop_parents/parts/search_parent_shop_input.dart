import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';

class SearchParentShopInput extends StatelessWidget {
  const SearchParentShopInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' Sowda merkezi gozle ',
        ),
      ),
    );
  }
}
