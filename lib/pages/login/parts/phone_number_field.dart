import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneNumberField extends ConsumerWidget {
  const PhoneNumberField({super.key, required this.phoneNumberCtrl});

  final TextEditingController phoneNumberCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: phoneNumberCtrl,
        maxLength: 8,
        keyboardType: TextInputType.phone,
        autofocus: true,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          prefixText: '+993 ',
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${lang.phoneNumber} ',
        ),
        validator: (validator) {
          var l = validator.toString().length;
          if (l != 8) return lang.enterYourCorrectPhoneNumber;
          return null;
        },
      ),
    );
  }
}
