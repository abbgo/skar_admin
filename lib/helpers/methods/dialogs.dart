import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<dynamic> showLogoutDialog(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${lang.areYouSureYouWantToLogOut} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              lang.no,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: () async {
                  await ref.read(accessTokenProvider.notifier).update('');
                  if (context.mounted) Navigator.pop(context);
                },
                child: Text(
                  lang.yes,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
