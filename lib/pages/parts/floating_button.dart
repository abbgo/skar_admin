import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.page, required this.text});

  final Widget page;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 5),
      onPressed: () => goToPage(context, page, false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
