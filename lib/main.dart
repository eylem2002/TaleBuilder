import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tale/utils/consts.dart';
import 'package:tale/utils/router/router_class.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/intro/intro_screen.dart';
import 'package:tale/view/screens/intro/splash_screen.dart';

int? initScreen = 0;
void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("dsf");
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: initScreen != null && initScreen != 0 ? "/" : "first",
      routes: {
        '/': (context) => SplashScreen(),
        "first": (context) => IntroScreen(),
      },
    );
  }
}
