import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';

class ProductColor {
  final String name;
  final int orderNumber;
  final List<String> dimensions;
  final List<ProductColorImage> images;
  final List<Dimension> selectedDimensions;
  final List<SelectedImage> selectedImages;

  ProductColor({
    required this.name,
    required this.orderNumber,
    required this.dimensions,
    required this.images,
    required this.selectedDimensions,
    required this.selectedImages,
  });

  factory ProductColor.defaultProductColor() {
    return ProductColor(
      name: '',
      orderNumber: 0,
      dimensions: [],
      images: [],
      selectedDimensions: [],
      selectedImages: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'order_number': orderNumber,
      'images': images,
      'dimensions': dimensions,
    };
  }
}
