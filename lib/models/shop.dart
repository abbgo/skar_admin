import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final String nameTM, nameRU;
  final String? id, addressTM, addressRU;
  final String? image;
  final double? latitude, longitude;
  final List<dynamic>? phones;
  final String? shopOwnerID;
  final bool? hasShipping;
  final Shop? parentShop;
  final String? parentShopID;
  final int? createdStatus;
  final String? rejectedReason;
  final bool? atHome;

  const Shop({
    this.id,
    required this.nameRU,
    required this.nameTM,
    this.latitude,
    this.longitude,
    this.image,
    this.addressTM,
    this.addressRU,
    this.phones,
    this.shopOwnerID,
    this.hasShipping,
    this.parentShop,
    this.parentShopID,
    this.createdStatus,
    this.rejectedReason,
    this.atHome,
  });

  factory Shop.defaultShop() {
    return const Shop(
      id: '',
      nameRU: '',
      nameTM: '',
      latitude: 0,
      longitude: 0,
      image: '',
      addressTM: '',
      addressRU: '',
      phones: [],
      shopOwnerID: '',
      hasShipping: false,
      parentShop: null,
      parentShopID: null,
      createdStatus: null,
      rejectedReason: null,
      atHome: null,
    );
  }

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      nameRU: json['name_ru'],
      nameTM: json['name_tm'],
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      image: json['image'] ?? "",
      addressTM: json['address_tm'] ?? "",
      addressRU: json['address_ru'] ?? "",
      phones: json['phones'] ?? [],
      shopOwnerID: json['shop_owner_id'] ?? '',
      hasShipping: json['has_shipping'] ?? false,
      parentShop: json['parent_shop'] == null
          ? Shop.defaultShop()
          : Shop.fromJson(json['parent_shop']),
      createdStatus: json['created_status'] ?? 2,
      rejectedReason: json['rejected_reason'] ?? '',
      atHome: json['at_home'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_tm': nameTM,
      'name_ru': nameRU,
      'latitude': latitude,
      'longitude': longitude,
      'address_tm': addressTM,
      'address_ru': addressRU,
      'phones': phones,
      'shop_owner_id': shopOwnerID,
      'has_shipping': hasShipping,
      'image': image,
      'parent_shop_id': parentShopID,
      'created_status': createdStatus,
      'at_home': atHome,
    };
  }

  @override
  List<Object?> get props => [id, nameTM, nameRU];
}

class ResultShop extends Equatable {
  final List<Shop>? shops;
  final Shop? shop;
  final String? message;
  final String error;

  const ResultShop({this.shops, this.shop, this.message, required this.error});

  factory ResultShop.defaultResult() {
    return const ResultShop(shops: null, shop: null, message: '', error: '');
  }

  @override
  List<Object?> get props => [shops, shop, message, error];
}
