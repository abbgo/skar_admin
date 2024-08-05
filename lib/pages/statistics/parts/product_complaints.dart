import 'package:flutter/material.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductComplaints extends StatelessWidget {
  const ProductComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 6,
        color: elevatedButtonColor,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.storefront_rounded, color: Colors.white),
              SizedBox(height: 10),
              Text(
                'some',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
