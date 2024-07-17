import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/products.dart';

class ProductsPageScrollButton extends ConsumerWidget {
  const ProductsPageScrollButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController =
        ref.watch(productsScrollControllerProvider);

    bool openSearchProductNavigateToTopButton =
        ref.watch(openProductdNavigateToTopButtonProvider);

    return openSearchProductNavigateToTopButton
        ? FloatingActionButton(
            onPressed: () async {
              scrollController.animateTo(
                scrollController.position.minScrollExtent,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          )
        : const SizedBox();
  }
}
