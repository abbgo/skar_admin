import 'package:equatable/equatable.dart';
import 'package:skar_admin/models/product_color.dart';

class Product {
  final String? id, shopID, brendID;
  final String nameTM, nameRU;
  final num? price, oldPrice;
  final String? image;
  final bool? isVisible;
  final List<String>? categoryIDs;
  final List<ProductColor>? productColors;

  Product({
    this.id,
    this.shopID,
    this.brendID,
    required this.nameTM,
    required this.nameRU,
    this.price,
    this.oldPrice,
    this.image,
    this.isVisible,
    this.categoryIDs,
    this.productColors,
  });

  factory Product.defaultProduct() {
    return Product(
      id: null,
      shopID: null,
      brendID: null,
      nameRU: '',
      nameTM: '',
      price: null,
      oldPrice: null,
      image: null,
      isVisible: false,
      categoryIDs: null,
      productColors: null,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      price: json['price'] ?? 0.0,
      oldPrice: json['old_price'] ?? 0.0,
      image: json['image'] ?? '',
      isVisible: json['is_visible'] ?? false,
    );
  }
}

class ResultProduct extends Equatable {
  final List<Product>? products;
  final Product? product;
  final String? message;
  final String error;

  const ResultProduct(
      {this.products, this.product, this.message, required this.error});

  factory ResultProduct.defaultResult() {
    return const ResultProduct(
      products: null,
      product: null,
      message: null,
      error: '',
    );
  }

  @override
  List<Object?> get props => [products, product, message, error];
}
