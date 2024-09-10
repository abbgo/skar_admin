import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtHomeInputButton extends ConsumerWidget {
  const AtHomeInputButton({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RadioMenuButton(
      value: value,
      groupValue: 1,
      onChanged: (value) {},
      child: Text(text),
    );
  }
}
