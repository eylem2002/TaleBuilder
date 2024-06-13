import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/search_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserService userService = UserService();
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        try {
          if (FirebaseAuth.instance.currentUser == null) {
            log("&&&");
            Navigator.of(context).pushReplacementNamed(signInScreen);
          } else {
            sharedUser = (await userService
                .getUserByEmail(FirebaseAuth.instance.currentUser!.email!))!;
            print(FirebaseAuth.instance.currentUser);
            Navigator.of(context).pushReplacementNamed(searchScreen);
          }
        } catch (e) {
          print("Error $e");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: ThemeManager.background,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: LayoutManager.widthNHeight0(context, 1) * 0.4,
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: LayoutManager.widthNHeight0(context, 1) * 0.7,
                    height: LayoutManager.widthNHeight0(context, 1) * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: LayoutManager.widthNHeight0(context, 1) * 0.05,
                ),
                Text(
                  "Discover The Power Of",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: LayoutManager.widthNHeight0(context, 1) * 0.075,
                      color: Colors.white,
                      fontFamily: ThemeManager.fontFamily),
                ),
                SizedBox(
                  height: LayoutManager.widthNHeight0(context, 1) * 0.008,
                ),
                GradientText(
                  'TaleBuilder',
                  gradient: ThemeManager.title,
                  style: TextStyle(
                      fontSize: LayoutManager.widthNHeight0(context, 1) * 0.075,
                      fontWeight: FontWeight.bold,
                      fontFamily: ThemeManager.fontFamily),
                ),
              ],
            ),
          )),
    );
  }
}
