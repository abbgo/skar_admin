import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/shops/parts/result_shops.dart';

class ShopsPage extends ConsumerWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResultShops();
  }
}
