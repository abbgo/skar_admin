import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';

final loadCreateProductProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final visibleProductProvider = StateProvider<bool>((ref) => true);

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
