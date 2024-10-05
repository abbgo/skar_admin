import 'package:flutter/material.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/pages/parts/gender_checkbox_list_tile/gender_checkbox_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GendersInput extends StatelessWidget {
  const GendersInput({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${lang.selectProductGenders} *',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GenderCheckboxListTile(title: lang.male, gender: Genders.male),
        GenderCheckboxListTile(title: lang.female, gender: Genders.female),
        GenderCheckboxListTile(title: lang.child, gender: Genders.child),
      ],
    );
  }
}
