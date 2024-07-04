import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';

class PopUpMenus extends StatelessWidget {
  const PopUpMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        popUpMenuMethod(),
      ],
    );
  }
}
