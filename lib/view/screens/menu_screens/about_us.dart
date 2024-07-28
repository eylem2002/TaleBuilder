import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: ThemeManager.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: LayoutManager.widthNHeight0(context, 1) * 0.1),
                child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ThemeManager.textColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Our Values',
                          style: TextStyle(
                            color: ThemeManager.second,
                            fontWeight: FontWeight.bold,
                            fontFamily: ThemeManager.fontFamily,
                            fontSize:
                                LayoutManager.widthNHeight0(context, 1) * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height:
                              LayoutManager.widthNHeight0(context, 1) * 0.03,
                        ),
                        Text(
                          'At TaleBuilder, we transform complex data findings into compelling narrative stories, enabling data scientists and analysts to communicate their results effectively to stakeholders. Our AI-driven tool simplifies the storytelling process, ensuring clarity and understanding.',
                          style: TextStyle(
                            color: ThemeManager.second,
                            fontWeight: FontWeight.bold,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: LayoutManager.widthNHeight0(context, 1) * 0.1,
              ),
              Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: ThemeManager.textColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.03,
                      ),
                      Text(
                        "   Harnessing AI to Transform Data Insights into Powerful Narratives for Clear Communication.\n \ncopy; 2024 TaleBuilder. All rights reserved.",
                        style: TextStyle(
                          color: ThemeManager.second,
                          fontWeight: FontWeight.bold,
                          fontFamily: ThemeManager.fontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
