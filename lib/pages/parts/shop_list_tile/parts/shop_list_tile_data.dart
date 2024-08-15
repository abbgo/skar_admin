import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/methods/dialogs.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/styles/colors.dart';

class ShopListTileData extends StatelessWidget {
  const ShopListTileData({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    String createdStatus = '';
    Color statusColor = Colors.green;

    switch (shop.createdStatus) {
      case CreatedStatuses.wait:
        createdStatus = lang.inReview;
        statusColor = elevatedButtonColor;
        break;
      case CreatedStatuses.rejected:
        createdStatus = lang.rejected;
        statusColor = Colors.red;
        break;
      case CreatedStatuses.success:
        createdStatus = lang.active;
        statusColor = Colors.green;
        break;
      default:
        createdStatus = lang.active;
        statusColor = Colors.green;
    }

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  isTM ? shop.nameTM : shop.nameRU,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      shop.hasShipping!
                          ? 'assets/icons/has_shipping.png'
                          : 'assets/icons/no_shipping.png',
                      height: 25,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: shop.rejectedReason != ''
                          ? () => showRejectedInfoDialog(
                                context,
                                shop.rejectedReason!,
                              )
                          : null,
                      child: Text(
                        createdStatus,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    shop.rejectedReason != ''
                        ? GestureDetector(
                            onTap: () => showRejectedInfoDialog(
                              context,
                              shop.rejectedReason!,
                            ),
                            child: const Icon(
                              Icons.info,
                              size: 16,
                              color: Colors.red,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
