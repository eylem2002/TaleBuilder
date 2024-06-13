import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/widgets/card_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu, color: ThemeManager.primary),
          onPressed: () {
            ///back
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            onPressed: () {
              ///back
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF0A061C),
                Color(0xFF110A27),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
            padding: EdgeInsets.only(
              left: LayoutManager.widthNHeight0(context, 1) * 0.035,
              right: LayoutManager.widthNHeight0(context, 1) * 0.035,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  'TaleBuilder',
                  gradient: ThemeManager.title,
                  style: TextStyle(
                    fontSize: LayoutManager.widthNHeight0(context, 1) * 0.085,
                    fontFamily: ThemeManager.fontFamily,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: LayoutManager.widthNHeight0(context, 1) * 0.003,
                    left: LayoutManager.widthNHeight0(context, 1) * 0.09,
                  ),
                  child: GradientText(
                    'Build, Share, and Enjoy',
                    gradient: ThemeManager.title,
                    style: TextStyle(
                      fontSize: LayoutManager.widthNHeight0(context, 1) * 0.045,
                      fontFamily: ThemeManager.fontFamily,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: LayoutManager.widthNHeight0(context, 1) * 0.065,
                ),
                //Search bar
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ThemeManager.second.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(searchScreen);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            LayoutManager.widthNHeight0(context, 1) * 0.04,
                        vertical:
                            LayoutManager.widthNHeight0(context, 1) * 0.03,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'How can we help you?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.grey[600]),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: LayoutManager.widthNHeight0(context, 1) * 0.09,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardDesign(
                            width:
                                LayoutManager.widthNHeight0(context, 1) * 0.43,
                            height:
                                LayoutManager.widthNHeight0(context, 1) * 0.6,
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  LayoutManager.widthNHeight0(context, 1) *
                                      0.05),
                              child: Column(
                                children: [
                                  GradientText(
                                    'Document Analyze',
                                    gradient: ThemeManager.title,
                                    style: TextStyle(
                                      height: LayoutManager.widthNHeight0(
                                              context, 1) *
                                          0.004,
                                      fontSize: LayoutManager.widthNHeight0(
                                              context, 1) *
                                          0.05,
                                      fontFamily: ThemeManager.fontFamily,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: LayoutManager.widthNHeight0(
                                            context, 1) *
                                        0.05,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/undraw_add_files.svg',
                                    width: 90,
                                    height: 90,
                                  ),
                                ],
                              ),
                            )),
                        //second card
                        CardDesign(
                          width: LayoutManager.widthNHeight0(context, 1) * 0.43,
                          height: LayoutManager.widthNHeight0(context, 1) * 0.6,
                          onTap: () {},
                          child: Center(
                            child: GradientText(
                              'Sign Up',
                              gradient: ThemeManager.title,
                              style: TextStyle(
                                fontSize:
                                    LayoutManager.widthNHeight0(context, 1) *
                                        0.05,
                                fontFamily: ThemeManager.fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardDesign(
                          width: LayoutManager.widthNHeight0(context, 1) * 0.43,
                          height: LayoutManager.widthNHeight0(context, 1) * 0.6,
                          onTap: () {},
                          child: Center(
                            child: GradientText(
                              'Sign Up',
                              gradient: ThemeManager.title,
                              style: TextStyle(
                                fontSize:
                                    LayoutManager.widthNHeight0(context, 1) *
                                        0.05,
                                fontFamily: ThemeManager.fontFamily,
                              ),
                            ),
                          ),
                        ),
                        CardDesign(
                          width: LayoutManager.widthNHeight0(context, 1) * 0.43,
                          height: LayoutManager.widthNHeight0(context, 1) * 0.6,
                          onTap: () {},
                          child: Center(
                            child: GradientText(
                              'Sign Up',
                              gradient: ThemeManager.title,
                              style: TextStyle(
                                fontSize:
                                    LayoutManager.widthNHeight0(context, 1) *
                                        0.05,
                                fontFamily: ThemeManager.fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
