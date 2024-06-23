import 'package:equatable/equatable.dart';

class ShopParams extends Equatable {
  final String? shopOwnerID;
  final bool? isDeleted;
  final int? page;

  const ShopParams({this.shopOwnerID, this.isDeleted, this.page});

  @override
  List<Object?> get props => [shopOwnerID, isDeleted, page];

  // ShopParams copyWith({String? shopOwnerID, bool? isDeleted, int? page}) {
  //   return ShopParams(
  //     shopOwnerID: shopOwnerID ?? this.shopOwnerID,
  //     isDeleted: isDeleted ?? this.isDeleted,
  //     page: page ?? this.page,
  //   );
  // }
}
