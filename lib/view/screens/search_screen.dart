import 'package:flutter/material.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/widgets/button_design.dart';
import 'package:tale/view/widgets/sign_form_filde.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF0A061C),
                  Color(0xFF110A27),
                  Color(0xFF140B2C),
                  Color(0xFF180D32),
                  Color(0xFF1D103A),
                  Color(0xFF20113D),
                ],
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all( LayoutManager.widthNHeight0(context, 1) * 0.045),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.17,
                    ),
                    GradientText(
                      'TaleBuilder',
                      gradient: ThemeManager.title,
                      style: TextStyle(
                          fontSize:
                              LayoutManager.widthNHeight0(context, 1) * 0.094,
                          fontFamily: ThemeManager.fontFamily),
                    )
                  ]),
            ))));
  }
}
