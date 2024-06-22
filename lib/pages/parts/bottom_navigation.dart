import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/bottom_navigation.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/pages/profile/profile.dart';
import 'package:skar_admin/pages/shops/shops.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/styles/colors.dart';

class BottomNavigationPart extends ConsumerWidget {
  const BottomNavigationPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const ShopsPage(),
      const ProductsPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     bottomNavigationBarItemMethod(
      //       lang.map,
      //       const Icon(Icons.travel_explore, size: 24),
      //       isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      //     ),
      //     bottomNavigationBarItemMethod(
      //       lang.myFavorites,
      //       const Icon(Icons.favorite_border, size: 24),
      //       isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      //     ),
      //     bottomNavigationBarItemMethod(
      //       lang.search,
      //       Image.asset(
      //         "assets/icons/search.png",
      //         color: isLightBrightness ? elevatedButtonColor : Colors.white,
      //         height: 24,
      //       ),
      //       isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      //     ),
      //     bottomNavigationBarItemMethod(
      //       lang.settings,
      //       Image.asset(
      //         "assets/icons/setting.png",
      //         color: isLightBrightness ? elevatedButtonColor : Colors.white,
      //         height: 22,
      //       ),
      //       isLightBrightness ? Colors.white : scaffoldColorDarkTheme,
      //     ),
      //   ],
      //   currentIndex: selectedIndex,
      //   onTap: (value) {
      //     ref.read(selectedBottomIndexProvider.notifier).state = value;
      //   },
      // ),
    );
  }
}
