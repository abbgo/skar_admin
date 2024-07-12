import 'package:equatable/equatable.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';

class ProductColor extends Equatable {
  final String name;
  final int orderNumber;
  final List<dynamic> dimensions;
  final List<ProductColorImage> images;
  final List<Dimension>? selectedDimensions;
  final List<SelectedImage>? selectedImages;

  const ProductColor({
    required this.name,
    required this.orderNumber,
    required this.dimensions,
    required this.images,
    this.selectedDimensions,
    this.selectedImages,
  });

  factory ProductColor.defaultProductColor() {
    return const ProductColor(
      name: '',
      orderNumber: 0,
      dimensions: [],
      images: [],
      selectedDimensions: [],
      selectedImages: [],
    );
  }

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      name: json['name'],
      orderNumber: json['order_number'],
      dimensions: json['dimensions'],
      images: List<ProductColorImage>.from(
        json['images'].map(
          (productColorImageJson) =>
              ProductColorImage.fromJson(productColorImageJson),
        ),
      ),
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

  @override
  List<Object?> get props => [
        name,
        orderNumber,
        dimensions,
        images,
        selectedDimensions,
        selectedImages
      ];
}
