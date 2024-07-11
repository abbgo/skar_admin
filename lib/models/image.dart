import 'dart:io';

import 'package:equatable/equatable.dart';

class ResultImage extends Equatable {
  final String? image;
  final String? message;
  final String error;

  const ResultImage({this.image, this.message, required this.error});

  factory ResultImage.defaultResult() {
    return const ResultImage(image: null, message: '', error: '');
  }

  @override
  List<Object?> get props => [image, message, error];
}

class SelectedImage {
  final String path;
  final File? image;

  const SelectedImage({required this.path, this.image});

  factory SelectedImage.defaultResult() {
    return const SelectedImage(path: '', image: null);
  }
}
