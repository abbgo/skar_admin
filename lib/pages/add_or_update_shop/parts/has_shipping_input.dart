import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HasShippingInput extends ConsumerWidget {
  const HasShippingInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool hasDelivery = ref.watch(hasShippingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            '${lang.isThereDeliveryService} : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Switch.adaptive(
            activeColor: elevatedButtonColor,
            value: hasDelivery,
            onChanged: (value) =>
                ref.read(hasShippingProvider.notifier).state = value,
          ),
        ],
      ),
    );
  }
}
