import 'package:awesome_app/main.dart';
import 'package:flutter/material.dart';

class NotifUtils {
  static void showSnackbar(String message,
      {Color? backgroundColor, SnackBarAction? action}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        action: action,
        content: Text(message),
      ),
    );
  }
}
