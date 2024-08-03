import 'package:flutter/material.dart';
import 'package:skar_admin/pages/profile/parts/language.dart';
import 'package:skar_admin/pages/profile/parts/shop_owner_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          ShopOwnerInfo(),
          LanguagePage(),
        ],
      ),
    );
  }
}
