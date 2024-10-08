import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/add_or_update_product_color_button.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/product_color_images_input.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/product_color_name_input.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/select_product_dimension.dart';
import 'package:skar_admin/pages/parts/cancel_button.dart';

class AddOrUpdateProductColorBody extends StatelessWidget {
  const AddOrUpdateProductColorBody({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    this.productColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;

  final ProductColor? productColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProductColorNameInput(ctrl: nameCtrl),
            const SelectProductDimension(),
            const ProductColorImagesInput(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CancelButton(),
                  AddOrUpdateProductColorButton(
                    formKey: formKey,
                    nameCtrl: nameCtrl,
                    oldProductColor: productColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
