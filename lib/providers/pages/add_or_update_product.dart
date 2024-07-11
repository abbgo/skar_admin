import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';

final loadCreateProductProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final visibleProductProvider = StateProvider<bool>((ref) => true);

class ProductColorsNotifier extends StateNotifier<List<ProductColor>> {
  ProductColorsNotifier() : super([]);

  Future<void> addProductColor(ProductColor productColor) async {
    if (!state.contains(productColor)) {
      state = [...state, productColor];
    }
  }
}

var productColorsProvider =
    StateNotifierProvider<ProductColorsNotifier, List<ProductColor>>(
  (ref) => ProductColorsNotifier(),
);

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

var productImagesProvider = StateNotifierProvider.autoDispose<
    SelectedProductImagesNotifier, List<SelectedImage>>(
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
