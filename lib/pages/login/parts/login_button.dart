import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          print('hemme zat gowy');
          return;
        }
      },
      child: const Text('Ulgama gir'),
    );
  }
}
