import 'package:equatable/equatable.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';

class ProductColor extends Equatable {
  final String name;
  final int orderNumber;
  final List<dynamic>? dimensions;
  final List<ProductColorImage> images;
  final List<Dimension>? selectedDimensions;
  // final List<SelectedImage>? selectedImages;

  const ProductColor({
    required this.name,
    required this.orderNumber,
    this.dimensions,
    required this.images,
    this.selectedDimensions,
    // this.selectedImages,
  });

  factory ProductColor.defaultProductColor() {
    return const ProductColor(
      name: '',
      orderNumber: 0,
      dimensions: [],
      images: [],
      selectedDimensions: [],
      // selectedImages: [],
    );
  }

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      name: json['name'],
      orderNumber: json['order_number'],
      selectedDimensions: json['dimensions'] == null
          ? []
          : List<Dimension>.from(
              json['dimensions'].map(
                (dimensionJson) => Dimension.fromJson(dimensionJson),
              ),
            ),
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

  ProductColor copyWith({
    String? name,
    int? orderNumber,
    List<dynamic>? dimensions,
    List<ProductColorImage>? images,
  }) {
    return ProductColor(
      name: name ?? this.name,
      orderNumber: orderNumber ?? this.orderNumber,
      dimensions: dimensions ?? this.dimensions,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [
        name,
        orderNumber,
        dimensions,
        images,
        selectedDimensions,
        // selectedImages
      ];
}
