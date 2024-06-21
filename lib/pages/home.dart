import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/login/login.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String token = ref.read(tokenProvider);

    return token.isEmpty ? LoginPage() : const Center(child: Text('Home Page'));
  }
}
