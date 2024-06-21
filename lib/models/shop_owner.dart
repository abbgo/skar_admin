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
