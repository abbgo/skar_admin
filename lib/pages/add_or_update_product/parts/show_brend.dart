import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/providers/pages/brend.dart';

class ShowBrend extends ConsumerWidget {
  const ShowBrend({super.key, this.oldBrend});

  final Brend? oldBrend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget showWidget;
    Brend selectedBrend = ref.watch(selectedBrendProvider);

    if (selectedBrend == Brend.defaultBrend() && oldBrend == null) {
      showWidget = const SizedBox();
    } else if (selectedBrend != Brend.defaultBrend()) {
      showWidget = Text(
        selectedBrend.name,
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      showWidget = Text(
        oldBrend!.name,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return showWidget;
  }
}
