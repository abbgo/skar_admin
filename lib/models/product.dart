import 'package:equatable/equatable.dart';

class Product {
  final String id, nameTM, nameRU;

  Product({
    required this.id,
    required this.nameTM,
    required this.nameRU,
  });

  factory Product.defaultProduct() {
    return Product(
      id: '',
      nameRU: '',
      nameTM: '',
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
    );
  }
}

class ResultProduct extends Equatable {
  final List<Product>? products;
  final Product? product;
  final String error;

  const ResultProduct({
    this.products,
    this.product,
    required this.error,
  });

  factory ResultProduct.defaultResult() {
    return const ResultProduct(
      products: null,
      product: null,
      error: '',
    );
  }

  @override
  List<Object?> get props => [
        products,
        product,
        error,
      ];
}
