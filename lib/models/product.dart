import 'package:equatable/equatable.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/models/product_color.dart';

class Product {
  final String? id, shopID, brendID;
  final String nameTM, nameRU;
  final num? price, oldPrice;
  final String? image;
  final bool? isVisible;
  final List<dynamic>? categoryIDs;
  final List<ProductColor>? productColors;
  final Brend? brend;
  final List<Category>? categories;
  final int? createdStatus;
  final String? rejectedReason;
  final List<dynamic>? genders;

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
    this.brend,
    this.categories,
    this.createdStatus,
    this.rejectedReason,
    this.genders,
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
      brend: null,
      categories: null,
      createdStatus: null,
      rejectedReason: null,
      genders: null,
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
      brendID: json['brend_id'] ?? '',
      isVisible: json['is_visible'] ?? false,
      productColors: json['product_colors'] == null
          ? []
          : List<ProductColor>.from(
              json['product_colors'].map(
                (productColorJson) => ProductColor.fromJson(productColorJson),
              ),
            ),
      brend: json['brend'] == null ? null : Brend.fromJson(json['brend']),
      categories: json['categories'] == null
          ? []
          : List<Category>.from(
              json['categories'].map(
                (categoryJson) => Category.fromJson(categoryJson),
              ),
            ),
      createdStatus: json['created_status'] ?? 2,
      rejectedReason: json['rejected_reason'] ?? '',
      genders: json['genders'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_tm': nameTM,
      'name_ru': nameRU,
      'price': price,
      'old_price': oldPrice,
      'brend_id': brendID,
      'shop_id': shopID,
      'categories': categoryIDs,
      'product_colors': productColors,
      'is_visible': isVisible,
      'image': image,
      'created_status': createdStatus,
      'genders': genders,
    };
  }
}

class ResultProduct extends Equatable {
  final List<Product>? products;
  final Product? product;
  final String? message;
  final int? count;
  final String error;

  const ResultProduct(
      {this.products,
      this.product,
      this.message,
      this.count,
      required this.error});

  factory ResultProduct.defaultResult() {
    return const ResultProduct(
      products: null,
      product: null,
      message: null,
      count: null,
      error: '',
    );
  }

  @override
  List<Object?> get props => [products, product, message, count, error];
}
