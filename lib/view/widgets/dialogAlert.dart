import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/theme_manager.dart';

// show a custom dialog with specific message to the user
Widget showCustomAlertDialog(BuildContext context, String message) {
  return AlertDialog(
    backgroundColor: ThemeManager.dark,
    content: Text(
      '$message',
      style: TextStyle(
        color: Colors.white,
        fontSize: LayoutManager.widthNHeight0(context, 1) * 0.035,
        fontFamily: ThemeManager.fontFamily,
      ),
      textAlign: TextAlign.center,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(
                fontFamily: ThemeManager.fontFamily,
                color: Colors.white,
                fontSize: LayoutManager.widthNHeight0(context, 1) * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
