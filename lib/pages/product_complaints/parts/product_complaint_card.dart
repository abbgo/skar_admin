import 'package:flutter/material.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';
import 'package:skar_admin/pages/product_complaints/parts/product_complaint_data.dart';

class ProductComplaintCard extends StatelessWidget {
  const ProductComplaintCard({super.key, required this.complaintProduct});

  final ComplaintProduct complaintProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ListTileImage(
            imagePath: complaintProduct.image,
            cardHeight: 120,
          ),
          ProductComplaintData(complaintProduct: complaintProduct),
          // ProductListTileData(product: product),
          // ProductPopUpMenu(productID: product.id!, shopID: shopID),
        ],
      ),
    );
  }
}
