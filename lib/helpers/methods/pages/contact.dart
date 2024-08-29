import 'package:flutter/material.dart';

showContactBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const ContactBottomSheet(),
  );
}
