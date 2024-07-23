import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/parts/product_pop_up_menu.dart';
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

Future<dynamic> showDeleteDialog(
  BuildContext context,
  WidgetRef ref,
  String? productID,
  String? shopID,
) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${lang.shouldThisInformationDeletedCompletely} ?'),
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
                  await deletePermanentlyProduct(
                    context,
                    ref,
                    productID!,
                    lang,
                  );
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

Future<dynamic> showDontDeleteDialog(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${lang.youCantDeleteThisShop} !'),
        content: Text(lang.youCanOnlyDeleteShopThatHasNoProductInIt),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      );
    },
  );
}
