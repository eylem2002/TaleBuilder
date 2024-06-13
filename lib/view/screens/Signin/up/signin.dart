import 'package:flutter/material.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/widgets/alert_box.dart';
import 'package:tale/view/widgets/button_design.dart';
import 'package:tale/view/widgets/sign_form_filde.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextController textController = TextController();
  final UserService userService = UserService();

  bool? isChecked = false;
  bool passToggle = true;

  @override
  void dispose() {
    textController.controllerEmail.dispose();
    textController.controllerPass.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Form(
              key: textController.formField,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.35,
                  ),
                  GradientText(
                    'TaleBuilder',
                    gradient: ThemeManager.title,
                    style: TextStyle(
                        fontSize:
                            LayoutManager.widthNHeight0(context, 1) * 0.094,
                        fontWeight: FontWeight.bold,
                        fontFamily: ThemeManager.fontFamily),
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.18,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormFieldWidgetSign(
                        passToggle: false,
                        passController: textController.controllerEmail,
                        labelText: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Enter a valid Email";
                          }
                          return null;
                        },
                        str: "email@gmail.com",
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.1,
                      ),
                      TextFormFieldWidgetSign(
                        passToggle: true,
                        passController: textController.controllerPass,
                        labelText: 'password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          if (value.length < 7) {
                            return "Password length should be more than 7 characters";
                          }
                          return null;
                        },
                        str: "Password",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.25,
                  ),
                  Center(
                    child: OutlinedContainerWithShadow(
                      width: LayoutManager.widthNHeight0(context, 1) * 0.5,
                      height: LayoutManager.widthNHeight0(context, 1) * 0.13,
                      onTap: () async {
                        if (textController.formField.currentState != null &&
                            textController.formField.currentState!.validate()) {
                          bool signInSuccess = await userService.signIn(
                            textController.controllerEmail.text,
                            textController.controllerPass.text,
                          );

                          if (signInSuccess) {
                            sharedUser = (await userService.getUserByEmail(
                                textController.controllerEmail.text))!;

                            Navigator.of(context)
                                .pushReplacementNamed(homeScreen);
                          } else {
                            print("error is happened");

                            showErrorDialog(context,
                                "An error has occurred. Don't have an account?");
                            textController.controllerEmail.clear();
                            textController.controllerPass.clear();
                          }
                        } else {
                          showErrorDialog(context,
                              "You have to enter the email and password in correct way!");
                        }
                      },
                      child: Center(
                        child: GradientText(
                          'Sign In',
                          gradient: ThemeManager.title,
                          style: TextStyle(
                            fontSize:
                                LayoutManager.widthNHeight0(context, 1) * 0.05,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .032,
                            fontFamily: ThemeManager.fontFamily,
                            color: ThemeManager.second),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(signUpScreen);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .03,
                                fontFamily: ThemeManager.fontFamily,
                                fontWeight: FontWeight.bold,
                                color: ThemeManager.second),
                          ))
                    ], //
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.4,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              dynamic result = await userService.signinAnon();
                              if (result == null) {
                                print('error signing in');
                              } else {
                                print('sign in');
                                print(result);
                                Navigator.of(context)
                                    .pushReplacementNamed(homeScreen);
                              }
                            },
                            child: Text(
                              "SignIn As Guest",
                              style: TextStyle(
                                  color: ThemeManager.primary,
                                  fontFamily: ThemeManager.fontFamily),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextController {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  GlobalKey<FormState> _formField = GlobalKey<FormState>();

  // ignore: unnecessary_getters_setters
  TextEditingController get controllerEmail => _controllerEmail;

  // ignore: unnecessary_getters_setters
  TextEditingController get controllerPass => _controllerPass;

  GlobalKey<FormState> get formField => _formField;

  set formField(value) {
    _formField = value;
  }

  set controllerPass(TextEditingController value) {
    _controllerPass = value;
  }

  set controllerEmail(TextEditingController value) {
    _controllerEmail = value;
  }
}
