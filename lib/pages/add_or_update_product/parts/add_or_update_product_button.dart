import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateProductButton extends StatelessWidget {
  const AddOrUpdateProductButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.priceCtrl,
    required this.oldPriceCtrl,
    required this.shopID,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController oldPriceCtrl;

  final String shopID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () {},
      child: Text(lang.add),
    );
  }
}
