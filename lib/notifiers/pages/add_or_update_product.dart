import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';

class ProductColorsNotifier extends StateNotifier<List<ProductColor>> {
  ProductColorsNotifier() : super([]);

  Future<void> addProductColor(ProductColor productColor) async {
    if (!state.contains(productColor)) {
      state = [...state, productColor];
    }
  }

  Future<void> setProductColors(List<ProductColor> productColors) async {
    state = productColors;
  }

  Future<void> removeAllProductColors() async {
    state = [];
  }
}

class SelectedProductImagesNotifier extends StateNotifier<List<SelectedImage>> {
  SelectedProductImagesNotifier() : super([]);

  Future<void> addImage(SelectedImage image) async {
    if (!state.contains(image)) {
      state = [...state, image];
    }
  }

  Future<void> removeImage(SelectedImage image) async {
    state = state.where((i) => i != image).toList();
  }
}

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

  Future<void> setDimensions(List<Dimension> dimensions) async {
    state = dimensions;
  }

  Future<void> removeAllDimensions() async {
    state = [];
  }
}
