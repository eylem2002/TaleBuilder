import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/Signin/up/signin.dart';
import 'package:tale/view/screens/Signin/up/signup.dart';
import 'package:tale/view/widgets/custom_text_form.dart';

//page to view all user info
class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  SignUpController signUpController = SignUpController();
  TextController textController = TextController();
  String name = "", role = "", emailAddress = "", phoneNu = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: ThemeManager.background,
        ),
        child: Form(
          key: signUpController.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Center(
                child: SizedBox(
                  width: LayoutManager.widthNHeight0(context, 1) * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GradientText(
                          'Namee',
                          gradient: ThemeManager.title,
                          style: TextStyle(
                            fontSize:
                                LayoutManager.widthNHeight0(context, 1) * 0.045,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.03,
                      ),
                      TextFormWidgetRead(
                        readly: true,
                        height: LayoutManager.widthNHeight0(context, 1) * 0.2,
                        width: double.infinity,
                        passToggle: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Name must not be empty ';
                          }
                          return null;
                        },
                        passController: signUpController.firstName,
                        str: sharedUser.name.toString().toUpperCase(),
                      ),
                      GradientText(
                        'Email Address',
                        gradient: ThemeManager.title,
                        style: TextStyle(
                          fontSize:
                              LayoutManager.widthNHeight0(context, 1) * 0.045,
                          fontFamily: ThemeManager.fontFamily,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.03,
                      ),
                      TextFormWidgetRead(
                        readly: true,
                        height: LayoutManager.widthNHeight0(context, 1) * 0.2,
                        width: double.infinity,
                        passToggle: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty ';
                          }
                          return null;
                        },
                        passController: signUpController.email,
                        str: sharedUser.email.toString(),
                      ),
                      GradientText(
                        'Phone',
                        gradient: ThemeManager.title,
                        style: TextStyle(
                          fontSize:
                              LayoutManager.widthNHeight0(context, 1) * 0.045,
                          fontFamily: ThemeManager.fontFamily,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.03,
                      ),
                      TextFormWidgetRead(
                        readly: true,
                        height: LayoutManager.widthNHeight0(context, 1) * 0.2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone must not be empty ';
                          }
                          return null;
                        },
                        width: double.infinity,
                        passToggle: false,
                        passController: signUpController.phone,
                        str: sharedUser.phone.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
