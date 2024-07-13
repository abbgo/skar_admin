import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_product_color/parts/add_product_color_button.dart';
import 'package:skar_admin/pages/add_product_color/parts/product_color_images_input.dart';
import 'package:skar_admin/pages/add_product_color/parts/product_color_name_input.dart';
import 'package:skar_admin/pages/add_product_color/parts/select_product_dimension.dart';
import 'package:skar_admin/pages/parts/cancel_button.dart';

class AddProductColorBody extends StatelessWidget {
  const AddProductColorBody(
      {super.key, required this.formKey, required this.nameCtrl});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;

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
                  AddProductColorButton(
                    formKey: formKey,
                    nameCtrl: nameCtrl,
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
