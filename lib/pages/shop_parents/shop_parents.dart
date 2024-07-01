import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/services/api/shop.dart';
import 'package:skar_admin/styles/colors.dart';

class ShopParentsPage extends StatelessWidget {
  const ShopParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 45,
          child: TextFormField(
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: elevatedButtonColor,
            decoration: InputDecoration(
              focusedBorder: inputBorder(),
              border: inputBorder(),
              labelText: ' Sowda merkezi gozle ',
            ),
          ),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ShopParams shopParams = ShopParams(
                  page: page,
                  isDeleted: false,
                  isShoppingCenter: true,
                );
                final AsyncValue<ResultShop> shops =
                    ref.watch(fetchShopsProvider(shopParams));

                return shops.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '') {
                      return null;
                    }
                    if (indexInPage >= response.shops!.length) {
                      return null;
                    }
                    Shop shop = response.shops![indexInPage];
                    return Card(
                      child: ListTile(
                        title: Text(shop.nameTM),
                      ),
                    );
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
