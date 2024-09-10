import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtHomeInputButton extends ConsumerWidget {
  const AtHomeInputButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(onPressed: () {}, child: Text(text));
  }
}
