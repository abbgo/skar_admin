import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_product_color/parts/product_color_name_input.dart';
import 'package:skar_admin/pages/add_product_color/parts/select_product_dimension.dart';

class AddProductColorPage extends StatefulWidget {
  const AddProductColorPage({super.key});

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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Form(
          key: productColorFormKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProductColorNameInput(ctrl: nameCtrl),
              const SelectProductDimension(),
            ],
          ),
        ),
      ),
    );
  }
}
