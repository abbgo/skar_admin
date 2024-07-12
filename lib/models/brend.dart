import 'package:equatable/equatable.dart';

class Brend {
  final String id, name, image;

  const Brend({required this.id, required this.name, required this.image});

  factory Brend.defaultBrend() {
    return const Brend(id: '', name: '', image: '');
  }

  factory Brend.fromJson(Map<String, dynamic> json) {
    return Brend(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class ResultBrend extends Equatable {
  final List<Brend>? brends;
  final String error;

  const ResultBrend({this.brends, required this.error});

  factory ResultBrend.defaultResult() {
    return const ResultBrend(brends: null, error: '');
  }

  @override
  List<Object?> get props => [brends, error];
}
