import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

Future<dynamic> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Siz hakykatdanam ulgamdan cykmakcymy ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Yok'),
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: () async {
                  await ref.read(accessTokenProvider.notifier).update('');
                  await ref.read(refreshTokenProvider.notifier).update('');
                  if (context.mounted) Navigator.pop(context);
                },
                child: const Text('Hawa'),
              );
            },
          ),
        ],
      );
    },
  );
}
