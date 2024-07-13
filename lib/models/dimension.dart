import 'package:equatable/equatable.dart';

class Dimension extends Equatable {
  final String id, dimension;

  const Dimension({required this.id, required this.dimension});

  factory Dimension.defaultDimension() {
    return const Dimension(id: '', dimension: '');
  }

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(id: json['id'], dimension: json['dimension']);
  }

  @override
  List<Object?> get props => [id, dimension];
}
