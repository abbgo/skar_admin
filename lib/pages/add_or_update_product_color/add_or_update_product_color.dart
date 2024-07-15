import 'package:flutter/material.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/add_or_update_product_color/parts/add_or_update_product_color_body.dart';

class AddOrUpdateProductColorPage extends StatefulWidget {
  const AddOrUpdateProductColorPage({super.key, this.productColor});

  final ProductColor? productColor;

  @override
  State<AddOrUpdateProductColorPage> createState() =>
      _AddOrUpdateProductColorPageState();
}

class _AddOrUpdateProductColorPageState
    extends State<AddOrUpdateProductColorPage> {
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
      body: addOrUpdateProductColorBodyMethod(),
    );
  }

  AddOrUpdateProductColorBody addOrUpdateProductColorBodyMethod() =>
      AddOrUpdateProductColorBody(
        formKey: productColorFormKey,
        nameCtrl: nameCtrl,
      );
}
