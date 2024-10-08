import 'package:equatable/equatable.dart';

class ComplaintProduct {
  final String id, nameTM, nameRU, image, shopID;
  final int complaintCount;

  const ComplaintProduct({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    required this.image,
    required this.complaintCount,
    required this.shopID,
  });

  factory ComplaintProduct.defaultComplaintProduct() {
    return const ComplaintProduct(
      id: '',
      nameTM: '',
      nameRU: '',
      image: '',
      complaintCount: 0,
      shopID: '',
    );
  }

  factory ComplaintProduct.fromJson(Map<String, dynamic> json) {
    return ComplaintProduct(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'],
      complaintCount: json['complaint_count'],
      shopID: json['shop_id'],
    );
  }
}

class ResultComplaintProduct extends Equatable {
  final List<ComplaintProduct>? complaintProducts;
  final String error;

  const ResultComplaintProduct({this.complaintProducts, required this.error});

  factory ResultComplaintProduct.defaultResult() {
    return const ResultComplaintProduct(complaintProducts: null, error: '');
  }

  @override
  List<Object?> get props => [complaintProducts, error];
}
