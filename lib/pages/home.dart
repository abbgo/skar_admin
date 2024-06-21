import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/pages/login/login.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String token = ref.read(tokenProvider);

    ref.listen(
      connectivityStatusProviders,
      (previous, next) {
        if (next == ConnectivityStatus.isDisonnected) {
          showIntConnErr(context);
        }
      },
    );

    return token.isEmpty ? LoginPage() : const Center(child: Text('Home Page'));
  }
}
