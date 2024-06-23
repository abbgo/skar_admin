import 'package:flutter/widgets.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/services/api/shop.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;

        ShopParams shopParams = ShopParams(page: page, isDeleted: false);
      },
    );
  }
}
