import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/input_part.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopCoordinatesInput extends StatelessWidget {
  const ShopCoordinatesInput({
    super.key,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
  });

  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dukanyn kordinatalaryny girizin *'),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: InputPart(
                ctrl: latitudeCtrl,
                label: 'Latitude *',
                keyboardType: TextInputType.number,
                validatorFunc: (validator) {
                  var l = validator.toString().length;
                  if (l < 1) return lang.pleaseEnterThisInformation;
                  return null;
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: InputPart(
                ctrl: longitudeCtrl,
                label: 'Longitude *',
                keyboardType: TextInputType.number,
                validatorFunc: (validator) {
                  var l = validator.toString().length;
                  if (l < 1) return lang.pleaseEnterThisInformation;
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
