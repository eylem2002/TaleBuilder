import 'package:flutter/material.dart';

// ThemeManager class to manage the application's theme colors and styles
class ThemeManager {
  // Primary color used throughout the app
  static Color primary = const Color(0xffB9CAFD);

  // backlist color used throughout the app
  static Color backlist = Color.fromARGB(255, 144, 165, 227);
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

BoxShadow shadowGlow = BoxShadow(
  color: Color(0xFFABC3FD).withOpacity(0.6),
  blurRadius: 5,
  spreadRadius: 1.5,
);

class BodyText extends StatelessWidget {
  final String text;
  const BodyText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFFD2D7FC),
      ),
    );
  }
}

class BodyInfo extends StatelessWidget {
  final String text;
  const BodyInfo(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          fontFamily: ThemeManager.fontFamily,
          color: ThemeManager.second),
    );
  }
}
