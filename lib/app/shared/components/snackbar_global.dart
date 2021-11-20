import 'package:flutter/material.dart';


class GlobalSnackBar {
  static final GlobalSnackBar instance = GlobalSnackBar();

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBarError(String msg) {
    rootScaffoldMessengerKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          msg,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 3)));
  }

  void showSnackBarSuccess(String msg) {
    rootScaffoldMessengerKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          msg,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 3)));
  }
}
