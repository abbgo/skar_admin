import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HasDeliveryInput extends ConsumerWidget {
  const HasDeliveryInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool hasDelivery = ref.watch(hasDeliveryProvider);
    return Row(
      children: [
        Text('${lang.isThereDeliveryService} : '),
        Switch.adaptive(
          activeColor: elevatedButtonColor,
          value: hasDelivery,
          onChanged: (value) =>
              ref.read(hasDeliveryProvider.notifier).state = value,
        ),
      ],
    );
  }
}
