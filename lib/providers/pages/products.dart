import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var hasProductsProvider = StateProvider.autoDispose<bool>((ref) => true);
var productSearchProvider = StateProvider<String>((ref) => '');

var productsScrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels > 1000) {
      ref.read(openProductdNavigateToTopButtonProvider.notifier).state = true;
    } else {
      ref.read(openProductdNavigateToTopButtonProvider.notifier).state = false;
    }
  });
  return controller;
});

var openProductdNavigateToTopButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);
