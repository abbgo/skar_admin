import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/notifiers/pages/add_or_update_product.dart';

final loadCreateProductProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final visibleProductProvider = StateProvider<bool>((ref) => true);

var productColorsProvider =
    StateNotifierProvider<ProductColorsNotifier, List<ProductColor>>(
  (ref) => ProductColorsNotifier(),
);

var productImagesProvider = StateNotifierProvider<SelectedProductImagesNotifier,
    List<ProductColorImage>>(
  (ref) => SelectedProductImagesNotifier(),
);

var selectedDimensionsProvider =
    StateNotifierProvider<SelectedDimensionsNotifier, List<Dimension>>(
  (ref) => SelectedDimensionsNotifier(),
);

var productGendersProvider =
    StateNotifierProvider<SelectedProductGendersNotifier, List<dynamic>>(
  (ref) => SelectedProductGendersNotifier(),
);
