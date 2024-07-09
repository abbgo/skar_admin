import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddColorPage extends StatelessWidget {
  const AddColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text(lang.productTypes)),
      floatingActionButton: const FloatingButton(
        page: AddOrUpdateShopPage(shopID: ''),
        text: 'Gosnus gos',
      ),
    );
  }
}
