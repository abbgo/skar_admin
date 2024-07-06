import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/pages/brends/brends.dart';
import 'package:skar_admin/providers/pages/brend.dart';

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
              Consumer(
                builder: (context, ref, child) {
                  Brend selectedBrend = ref.watch(selectedBrendProvider);

                  return Text(
                    selectedBrend.name,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              )
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
