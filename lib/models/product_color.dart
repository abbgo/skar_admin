import 'package:skar_admin/models/image.dart';

class ProductColor {
  final String name;
  final int orderNumber;
  final List<String> dimensions;
  final List<ProductColorImage> images;

  ProductColor({
    required this.name,
    required this.orderNumber,
    required this.dimensions,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'order_number': orderNumber,
      'images': images,
      'dimensions': dimensions,
    };
  }
}
