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
      showWidget = ShowBrendPart(brend: selectedBrend);
    } else {
      showWidget = ShowBrendPart(brend: oldBrend!);
    }

    return showWidget;
  }
}

class ShowBrendPart extends StatelessWidget {
  const ShowBrendPart({super.key, required this.brend});

  final Brend brend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          brend.name,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Consumer(
          builder: (context, ref, child) {
            return IconButton(
              onPressed: () => ref.read(selectedBrendProvider.notifier).state =
                  Brend.defaultBrend(),
              icon: const Icon(Icons.delete_forever, color: Colors.red),
            );
          },
        ),
      ],
    );
  }
}
