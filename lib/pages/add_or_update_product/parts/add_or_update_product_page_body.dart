import 'package:flutter/material.dart';

class AddOrUpdateProductPageBody extends StatelessWidget {
  const AddOrUpdateProductPageBody({
    super.key,
    required this.productFormKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
    required this.priceCtrl,
    required this.oldPriceCtrl,
    required this.shopID,
  });

  final GlobalKey<FormState> productFormKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController oldPriceCtrl;

  final String shopID;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Form(
            key: productFormKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [],
            ),
          ),
        )
      ],
    );
  }
}
