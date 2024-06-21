import 'package:equatable/equatable.dart';

class ShopOwner {
  final String fullName;
  final String phoneNumber;

  ShopOwner({required this.fullName, required this.phoneNumber});

  factory ShopOwner.fromJson(Map<String, dynamic> json) {
    return ShopOwner(
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
    );
  }

  factory ShopOwner.defaultShopOwner() {
    return ShopOwner(fullName: '', phoneNumber: '');
  }
}

class ResultLoginShopOwner extends Equatable {
  final ShopOwner shopOwner;
  final String accessToken;
  final String refreshToken;
  final String error;

  const ResultLoginShopOwner({
    required this.shopOwner,
    required this.accessToken,
    required this.refreshToken,
    required this.error,
  });

  factory ResultLoginShopOwner.defaultResult() {
    return ResultLoginShopOwner(
      shopOwner: ShopOwner.defaultShopOwner(),
      accessToken: '',
      refreshToken: '',
      error: '',
    );
  }

  @override
  List<Object?> get props => [shopOwner, accessToken, refreshToken, error];
}
