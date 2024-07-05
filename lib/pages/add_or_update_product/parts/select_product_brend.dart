import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectProductBrend extends StatelessWidget {
  const SelectProductBrend({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${lang.enterTheProductBrand} *',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.travel_explore),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
