import 'package:equatable/equatable.dart';

class ShopOwner {
  final String id;
  final String fullName;
  final String phoneNumber;

  ShopOwner(
      {required this.id, required this.fullName, required this.phoneNumber});

  factory ShopOwner.fromJson(Map<String, dynamic> json) {
    return ShopOwner(
      id: json['id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
    );
  }

  factory ShopOwner.defaultShopOwner() {
    return ShopOwner(id: '', fullName: '', phoneNumber: '');
  }
}

class ResultLoginShopOwner extends Equatable {
  final ResponseLoginShopOwner? responseLoginShopOwner;
  final String error;

  const ResultLoginShopOwner({
    this.responseLoginShopOwner,
    required this.error,
  });

  factory ResultLoginShopOwner.defaultResult() {
    return ResultLoginShopOwner(
      responseLoginShopOwner: ResponseLoginShopOwner.defaultResponse(),
      error: '',
    );
  }

  @override
  List<Object?> get props => [responseLoginShopOwner, error];
}

class ResponseLoginShopOwner {
  final ShopOwner shopOwner;
  final String accessToken;
  final String refreshToken;

  const ResponseLoginShopOwner({
    required this.shopOwner,
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResponseLoginShopOwner.defaultResponse() {
    return ResponseLoginShopOwner(
      shopOwner: ShopOwner.defaultShopOwner(),
      accessToken: '',
      refreshToken: '',
    );
  }

  factory ResponseLoginShopOwner.fromJson(Map<String, dynamic> json) {
    return ResponseLoginShopOwner(
      shopOwner: ShopOwner.fromJson(json['shop_owner']),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
