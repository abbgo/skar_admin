import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisonnected }

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.notDetermined) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      switch (result[0]) {
        case ConnectivityResult.mobile:
          newState = ConnectivityStatus.isConnected;
          break;
        case ConnectivityResult.wifi:
          newState = ConnectivityStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectivityStatus.isDisonnected;
          break;
        default:
          newState = ConnectivityStatus.isDisonnected;
      }
      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}
