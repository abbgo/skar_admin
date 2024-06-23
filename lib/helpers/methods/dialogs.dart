import 'package:flutter/material.dart';

Future<dynamic> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Siz hakykatdanam ulgamdan cykmakcymy ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Yok'),
          ),
          TextButton(
            onPressed: () {
              // Handle positive button click (e.g., perform action)
              Navigator.pop(context);
              // You can add your logic here
            },
            child: const Text('Hawa'),
          ),
        ],
      );
    },
  );
}
