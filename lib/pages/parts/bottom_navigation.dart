import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/dialogs.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/parts/bottom_navigation.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/profile/profile.dart';
import 'package:skar_admin/pages/shops/shops.dart';
import 'package:skar_admin/pages/statistics/statistics.dart';
import 'package:skar_admin/pages/trash/trash.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationPart extends ConsumerWidget {
  const BottomNavigationPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const StatisticsPage(),
      const ShopsPage(isDeleted: false),
      const TrashPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: selectedIndex == 3 || selectedIndex == 1
          ? AppBar(
              actions: [
                selectedIndex == 1
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () => goToPage(
                                context,
                                const AddOrUpdateShopPage(shopID: ''),
                                false,
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () =>
                                  ref.invalidate(fetchShopsProvider),
                              child: const Icon(Icons.autorenew),
                            ),
                          ),
                        ],
                      )
                    : IconButton(
                        onPressed: () => showLogoutDialog(context),
                        icon: const Icon(Icons.logout),
                      ),
              ],
            )
          : null,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          bottomNavigationBarItemMethod(
            lang.analysis,
            const Icon(Icons.analytics, size: 24),
          ),
          bottomNavigationBarItemMethod(
            lang.myShops,
            const Icon(Icons.storefront_rounded, size: 24),
          ),
          bottomNavigationBarItemMethod(
            lang.trash,
            const Icon(Icons.auto_delete, size: 24),
          ),
          bottomNavigationBarItemMethod(
            lang.profile,
            const Icon(Icons.person, size: 24),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          ref.read(selectedBottomIndexProvider.notifier).state = value;
        },
      ),
    );
  }
}
