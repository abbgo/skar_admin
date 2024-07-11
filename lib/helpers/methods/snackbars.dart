import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showIntConnErr(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      AppLocalizations.of(context)!.noIntConn,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSomeErr(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      AppLocalizations.of(context)!.someErrorOccurred,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showUserNotFound(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      AppLocalizations.of(context)!.userNotFound,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSuccess(BuildContext context, String text) {
  var snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showEnterInformationWarning(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      AppLocalizations.of(context)!.pleaseEnterInformationsCompletely,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.orange,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
