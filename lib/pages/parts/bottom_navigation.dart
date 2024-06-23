import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/bottom_navigation.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/pages/profile/profile.dart';
import 'package:skar_admin/pages/shops/shops.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationPart extends ConsumerWidget {
  const BottomNavigationPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const ShopsPage(),
      const ProductsPage(),
      const ProfilePage(),
    ];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            bottomNavigationBarItemMethod(
              lang.myShops,
              const Icon(Icons.storefront_rounded, size: 24),
            ),
            bottomNavigationBarItemMethod(
              lang.myProducts,
              const Icon(Icons.local_mall, size: 24),
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
      ),
    );
  }
}
