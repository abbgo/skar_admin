import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class GendersInput extends ConsumerWidget {
  const GendersInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> productGenders = ref.watch(productGendersProvider);
    return Text(productGenders.toString());
  }
}
