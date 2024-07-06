import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_product/parts/show_brend.dart';
import 'package:skar_admin/pages/brends/brends.dart';

class SelectProductBrend extends StatelessWidget {
  const SelectProductBrend({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${lang.enterTheProductBrand} : ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const ShowBrend(),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => goToPage(context, const BrendsPage(), false),
              child: Text(lang.selectBrand),
            ),
          )
        ],
      ),
    );
  }
}
