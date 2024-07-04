import 'package:equatable/equatable.dart';

class Product {
  final String id, nameTM, nameRU;
  final num? price, oldPrice;
  final String? image;
  final bool? isVisible;

  Product({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    this.price,
    this.oldPrice,
    this.image,
    required this.isVisible,
  });

  factory Product.defaultProduct() {
    return Product(
      id: '',
      nameRU: '',
      nameTM: '',
      price: null,
      oldPrice: null,
      image: null,
      isVisible: false,
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
  final String error;

  const ResultProduct({this.products, this.product, required this.error});

  factory ResultProduct.defaultResult() {
    return const ResultProduct(products: null, product: null, error: '');
  }

  @override
  List<Object?> get props => [products, product, error];
}
