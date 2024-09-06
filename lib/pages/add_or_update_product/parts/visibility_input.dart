import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VisibilityInput extends ConsumerWidget {
  const VisibilityInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isVisible = ref.watch(visibleProductProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            '${lang.showProduct} : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Switch.adaptive(
            activeColor: elevatedButtonColor,
            value: isVisible,
            onChanged: (value) =>
                ref.read(visibleProductProvider.notifier).state = value,
          ),
        ],
      ),
    );
  }
}
