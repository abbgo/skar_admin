import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/internet.dart';
import 'package:skar_admin/notifiers/internet_connection.dart';

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});

var checkInternetConnProvider =
    FutureProvider.autoDispose.family<bool, BuildContext>((ref, arg) async {
  return await checkIntWithContextConn(arg);
});
