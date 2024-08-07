import 'package:flutter/material.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';
import 'package:skar_admin/pages/product_complaints/parts/product_complaint_data.dart';
import 'package:skar_admin/pages/product_complaints/parts/product_complaint_pop_up_menu.dart';

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
            cardWidth: 80,
          ),
          ProductComplaintData(complaintProduct: complaintProduct),
          ProductComplaintPopUpMenu(
            productID: complaintProduct.id,
            shopID: complaintProduct.shopID,
          ),
        ],
      ),
    );
  }
}
