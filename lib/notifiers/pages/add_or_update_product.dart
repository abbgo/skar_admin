import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';

class ProductColorsNotifier extends StateNotifier<List<ProductColor>> {
  ProductColorsNotifier() : super([]);

  Future<void> addProductColor(ProductColor productColor) async {
    bool hasInState = false;

    for (ProductColor element in state) {
      if (element.name == productColor.name) {
        hasInState = true;
      }
    }

    if (!hasInState) {
      state = [...state, productColor];
    }
  }

  Future<void> setProductColors(List<ProductColor> productColors) async {
    state = productColors;
  }

  Future<void> removeAllProductColors() async {
    state = [];
  }

  Future<void> changeProductColor(ProductColor productColor) async {
    state = [
      for (ProductColor element in state)
        if (element.orderNumber == productColor.orderNumber)
          element.copyWith(
            name: productColor.name,
            dimensions: productColor.dimensions,
            images: productColor.images,
            selectedDimensions: productColor.selectedDimensions,
          )
        else
          element
    ];
  }
}

class SelectedProductImagesNotifier
    extends StateNotifier<List<ProductColorImage>> {
  SelectedProductImagesNotifier() : super([]);

  Future<void> addImage(ProductColorImage image) async {
    if (!state.contains(image)) {
      state = [...state, image];
    }
  }

  Future<void> removeImage(ProductColorImage image) async {
    state = state.where((i) => i != image).toList();
  }

  Future<void> setImages(List<ProductColorImage> images) async {
    state = images;
  }

  Future<void> removeAllImages() async {
    state = [];
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

class SelectedProductGendersNotifier extends StateNotifier<List<dynamic>> {
  SelectedProductGendersNotifier() : super([]);

  Future<void> addGender(dynamic gender) async {
    if (!state.contains(gender)) {
      state = [...state, gender];
    }
  }

  Future<void> removeGender(dynamic gender) async {
    state = state.where((i) => i != gender).toList();
  }

  Future<void> setProductGenders(List<dynamic> genders) async {
    state = genders;
  }

  Future<void> removeAllGenders() async {
    state = [];
  }
}
