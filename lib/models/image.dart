import 'package:equatable/equatable.dart';

class ResultImage extends Equatable {
  final String? image;
  final String error;

  const ResultImage({this.image, required this.error});

  factory ResultImage.defaultResult() {
    return const ResultImage(image: null, error: '');
  }

  @override
  List<Object?> get props => [image, error];
}
