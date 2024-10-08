import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_shop/parts/coordinate_input.dart';
import 'package:skar_admin/pages/map/map.dart';
import 'package:skar_admin/providers/pages/map.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${lang.enterTheCoordinatesOfTheShop} *',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  goToPage(context, const MapPage(), false);
                },
                icon: const Icon(Icons.travel_explore),
              ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              String latLong = ref.watch(latLongProvider);
              if (latLong.isNotEmpty || latLong != '') {
                Future.delayed(const Duration(seconds: 1), () {
                  latitudeCtrl.text = latLong.split(' ')[0];
                  longitudeCtrl.text = latLong.split(' ')[1];
                });
              }
              return Row(
                children: [
                  CoordinateInput(
                    ctrl: latitudeCtrl,
                    label: 'Latitude *',
                    errorString: lang.pleaseEnterInformationsCompletely,
                  ),
                  const SizedBox(width: 20),
                  CoordinateInput(
                    ctrl: longitudeCtrl,
                    label: 'Longitude *',
                    errorString: lang.pleaseEnterInformationsCompletely,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
