import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/providers/pages/brend.dart';

class ShowBrend extends ConsumerWidget {
  const ShowBrend({super.key, this.oldBrend});

  final Brend? oldBrend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Brend selectedBrend = ref.watch(selectedBrendProvider);

    return Text(
      selectedBrend.name!,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
