import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/pages/profile.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPart extends StatelessWidget {
  const ContactPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: elevatedButtonColor,
      child: ListTile(
        onTap: () => showLanguageMethod(context),
        leading: const Icon(Icons.perm_phone_msg_outlined, color: Colors.white),
        title: Text(
          AppLocalizations.of(context)!.contact,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
