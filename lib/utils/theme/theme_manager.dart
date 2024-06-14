import 'package:flutter/material.dart';

// ThemeManager class to manage the application's theme colors and styles
class ThemeManager {
  // Primary color used throughout the app
  static Color primary = const Color.fromARGB(255, 158, 191, 216);

// white color used throughout the app
  static Color white = const Color(0xffFFFFFF);

  // dark color used for backgrounds and other elements
  static Color dark = const Color.fromARGB(255, 75, 151, 168);

  // Secondary color used for backgrounds and other elements
  static Color second = Color.fromARGB(255, 158, 191, 216);

// Background color for the app
  static Gradient background = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: const [
      Color(0xFF071223),
      Color(0xFF071526),
      Color(0xFF05273C),
    ],
  );

  // Color for text elements
  static Color textColor = Color.fromARGB(255, 75, 151, 168);

  // Background color for containers
  static Color containerback = const Color(0xffE2D1B9);

  static Gradient title = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 20, 125, 163),
      Color.fromARGB(255, 119, 154, 180),
      Color.fromARGB(255, 75, 151, 168),
    ],
  );

  static Gradient sideMenu = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF071223),
      Color(0xFF071526),
      Color(0xFF05273C),
    ],
  );

  static Gradient sideTopMenu = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF071223),
      Color(0xFF071526),
      Color(0xFF05273C),
    ],
  );

  // Font family used in the app
  static String fontFamily = 'Trocchi';

  // Default text style for the app
  static TextStyle textStyle = TextStyle(
      fontFamily: 'Trocchi',
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  // Default button style for the app
  static ButtonStyle buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all(ThemeManager.second));
}
