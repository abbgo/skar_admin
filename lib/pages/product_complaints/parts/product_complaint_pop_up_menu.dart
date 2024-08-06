import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/pages/complaints/complaints.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductComplaintPopUpMenu extends ConsumerWidget {
  const ProductComplaintPopUpMenu(
      {super.key, required this.productID, required this.shopID});

  final String productID;
  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    List<String> texts = [lang.change, lang.seeComplaints];

    List<IconData> icons = [Icons.edit, Icons.visibility];

    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], icons[0]),
        popUpMenuMethod(texts[1], icons[1]),
      ],
      onSelected: (value) async {
        if (value == texts[0]) {
          goToPage(
            context,
            AddOrUpdateProductPage(shopID: shopID, productID: productID),
            false,
          );
          return;
        }

        if (value == texts[1]) {
          goToPage(context, const ComplaintsPage(), false);
        }
      },
    );
  }
}
