import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/parts/bottom_navigation.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/pages/profile/profile.dart';
import 'package:skar_admin/pages/shops/shops.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          bottomNavigationBarItemMethod(
            'Dukanlarym',
            const Icon(Icons.storefront_sharp, size: 24),
          ),
          bottomNavigationBarItemMethod(
            'Harytlarym',
            const Icon(Icons.favorite_border, size: 24),
          ),
          bottomNavigationBarItemMethod(
            'Profile',
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
