import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/input.dart';
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
      body: const Center(
        child: Text('Shop Parents'),
      ),
    );
  }
}
