import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';

class ShopNameTmInput extends StatelessWidget {
  const ShopNameTmInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: phoneNumberCtrl,
      keyboardType: TextInputType.text,
      autofocus: true,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: elevatedButtonColor,
      decoration: InputDecoration(
        focusedBorder: inputBorder(),
        border: inputBorder(),
        labelText: ' Ady(tm) ',
      ),
      // validator: (validator) {
      //   var l = validator.toString().length;
      //   if (l != 8) return lang.enterYourCorrectPhoneNumber;
      //   return null;
      // },
    );
  }
}
