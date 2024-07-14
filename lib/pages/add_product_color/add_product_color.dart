import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/add_product_color/parts/add_product_color_body.dart';

class AddProductColorPage extends StatefulWidget {
  const AddProductColorPage({super.key, this.productColor});

  final ProductColor? productColor;

  @override
  State<AddProductColorPage> createState() => _AddProductColorPageState();
}

class _AddProductColorPageState extends State<AddProductColorPage> {
  final GlobalKey<FormState> productColorFormKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productColor != null) {
      nameCtrl.text = widget.productColor!.name;
    }

    return Scaffold(
      appBar: AppBar(),
      body: addProductColorBodyMethod(),
    );
  }

  AddProductColorBody addProductColorBodyMethod() => AddProductColorBody(
        formKey: productColorFormKey,
        nameCtrl: nameCtrl,
        oldImages: widget.productColor!.images,
      );
}
