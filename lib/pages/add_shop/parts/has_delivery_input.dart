import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

class HasDeliveryInput extends ConsumerWidget {
  const HasDeliveryInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasDelivery = ref.watch(hasDeliveryProvider);
    return Row(
      children: [
        const Text('Eltip bermek hyzmaty bar: '),
        Switch.adaptive(
          value: hasDelivery,
          onChanged: (value) =>
              ref.read(hasDeliveryProvider.notifier).state = value,
        ),
      ],
    );
  }
}
