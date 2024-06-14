// import 'package:flutter/material.dart';

// // ThemeManager class to manage the application's theme colors and styles
// class ThemeManager {
//   // Primary color used throughout the app
//   static Color primary = const Color.fromARGB(255, 158, 191, 216);

// // white color used throughout the app
//   static Color white = const Color(0xffFFFFFF);

//   // dark color used for backgrounds and other elements
//   static Color dark = const Color.fromARGB(255, 75, 151, 168);

//   // Secondary color used for backgrounds and other elements
//   static Color second = Color.fromARGB(255, 158, 191, 216);

// // Background color for the app
//   static Gradient background = const LinearGradient(
//     begin: Alignment.topRight,
//     end: Alignment.bottomLeft,
//     colors: const [
//       Color.fromARGB(255, 14, 35, 66),
//       Color.fromARGB(255, 12, 33, 58),
//       Color(0xFF05273C),
//     ],
//   );

//   // Color for text elements
//   static Color textColor = Color.fromARGB(255, 75, 151, 168);

//   // Background color for containers
//   static Color containerback = const Color(0xffE2D1B9);

//   static Gradient title = const LinearGradient(
//     begin: Alignment.topRight,
//     end: Alignment.bottomLeft,
//     colors: [
//       Color.fromARGB(255, 35, 148, 189),
//       Color.fromARGB(255, 136, 171, 198),
//       Color.fromARGB(255, 98, 181, 199),
//     ],
//   );

//   static Gradient sideMenu = const LinearGradient(
//     begin: Alignment.topRight,
//     end: Alignment.bottomLeft,
//     colors: [
//       Color.fromARGB(155, 16, 41, 72),
//       Color.fromARGB(172, 14, 70, 105),
//       Color.fromARGB(177, 28, 52, 89),
//       Color.fromARGB(176, 39, 68, 112),
//       Color.fromARGB(176, 44, 75, 123),
//     ],
//   );

//   static Gradient sideTopMenu = const LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomLeft,
//     colors: [
//       Color(0xFF071223),
//       Color(0xFF071526),
//       Color(0xFF05273C),
//     ],
//   );

//   // Font family used in the app
//   static String fontFamily = 'Trocchi';

//   // Default text style for the app
//   static TextStyle textStyle = TextStyle(
//       fontFamily: 'Trocchi',
//       color: textColor,
//       fontWeight: FontWeight.bold,
//       fontSize: 16);

//   // Default button style for the app
//   static ButtonStyle buttonStyle = ButtonStyle(
//       shape: MaterialStateProperty.all(const StadiumBorder()),
//       backgroundColor: MaterialStateProperty.all(ThemeManager.second));
// }

import 'package:flutter/material.dart';

// ThemeManager class to manage the application's theme colors and styles
class ThemeManager {
  // Primary color used throughout the app
  static Color primary = const Color(0xffB9CAFD);

  // Secondary color used for backgrounds and other elements
  static Color second = const Color(0xffE2E2FC);

// Background color for the app
  static Gradient Topbackground = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: const [
      Color(0xFF0A061C),
      Color(0xFF110A27),
    ],
  );

// Background color for the app
  static Gradient background = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: const [
      Color(0xFF0A061C),
      Color(0xFF110A27),
      Color(0xFF140B2C),
      Color(0xFF180D32),
      Color(0xFF1D103A),
      Color(0xFF20113D)
    ],
  );
// // white color used throughout the app
  static Color white = const Color(0xffe9e9e9);

//   // dark color used for backgrounds and other elements
  static Color dark = const Color(0xFF0A061C);

  // Color for text elements
  static Color textColor = const Color(0xFF0A061C);

  // Background color for containers
  static Color containerback = const Color(0xffE2D1B9);

  static Gradient title = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFF2EFFC),
      Color(0xFFD2D7FC),
      Color(0xFFABC3FD),
    ],
  );

  static Gradient sideMenu = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      //   Color.fromARGB(255, 171, 178, 227),
      // Color.fromARGB(255, 145, 171, 232),
      // Color.fromARGB(255, 120, 138, 179),

      Color(0xFFD2D7FC),
      Color(0xFFABC3FD),
      Color.fromARGB(255, 181, 193, 222),
    ],
  );

  static Gradient sideTopMenu = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFD2D7FC),
      Color(0xFFABC3FD),
      Color.fromARGB(255, 181, 193, 222),
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
