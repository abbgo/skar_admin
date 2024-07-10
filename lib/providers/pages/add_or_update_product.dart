import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';

final loadCreateProductProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final visibleProductProvider = StateProvider<bool>((ref) => true);
final productImageProvider = StateProvider.autoDispose<File?>((ref) => null);

class SelectedProductImagesNotifier extends StateNotifier<List<String>> {
  SelectedProductImagesNotifier() : super([]);

  Future<void> addImage(String image) async {
    if (!state.contains(image)) {
      state = [...state, image];
    }
  }
}

var productImagePathsProvider =
    StateNotifierProvider<SelectedProductImagesNotifier, List<String>>(
  (ref) => SelectedProductImagesNotifier(),
);

class SelectedDimensionsNotifier extends StateNotifier<List<Dimension>> {
  SelectedDimensionsNotifier() : super([]);

  Future<void> addDimension(Dimension dimension) async {
    if (!state.contains(dimension)) {
      state = [...state, dimension];
    }
  }

  Future<void> removeDimension(Dimension dimension) async {
    state = state.where((i) => i != dimension).toList();
  }
}

var selectedDimensionsProvider =
    StateNotifierProvider<SelectedDimensionsNotifier, List<Dimension>>(
  (ref) => SelectedDimensionsNotifier(),
);
