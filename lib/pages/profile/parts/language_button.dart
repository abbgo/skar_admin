import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/styles/colors.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key, required this.text, required this.lang});

  final String text;
  final String lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String language = ref.read(langProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              language == lang ? elevatedButtonColor : Colors.white,
        ),
        onPressed: () async {
          await ref.read(langProvider.notifier).update(lang);
          // await ref.read(markersProvider.notifier).removeAllMarkers();
          // if (context.mounted) {
          //   Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const BottomNavigationPage(),
          //     ),
          //     (Route<dynamic> route) => false,
          //   );
          // }
        },
        child: Text(
          text,
          style: TextStyle(
            color: language == lang ? Colors.white : elevatedButtonColor,
          ),
        ),
      ),
    );
  }
}
