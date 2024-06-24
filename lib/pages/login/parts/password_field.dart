import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/providers/pages/login.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key, required this.passwordCtrl});

  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool passwordVisible = ref.watch(passwordVisibleProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100.0, minHeight: 100.0),
      child: TextFormField(
        controller: passwordCtrl,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () =>
                ref.read(passwordVisibleProvider.notifier).changeVisibility(),
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          ),
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${lang.password} *',
        ),
        validator: (validator) {
          var l = validator.toString().length;
          if (l < 1) return lang.enterYourPassword;
          return null;
        },
      ),
    );
  }
}
