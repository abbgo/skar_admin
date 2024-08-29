import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/styles/colors.dart';

class ContactBottomSheet extends ConsumerWidget {
  const ContactBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> shopPhones = ['+99362214645', '+99362420377'];

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: shopPhones
            .map(
              (e) => ListTile(
                title: Text(
                  e.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: e.toString()));
                      },
                      icon: Icon(Icons.copy_all, color: elevatedButtonColor),
                    ),
                    IconButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber(e.toString());
                      },
                      icon: const Icon(Icons.call, color: Colors.green),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
