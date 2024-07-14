import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/Signin/up/signup.dart';
import 'package:tale/view/widgets/button_design.dart';
import 'package:tale/view/widgets/dialogAlert.dart';

//page to change user info
class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key});

  @override
  State<ChangeInfo> createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  String name = "", emailAddress = "", phoneNu = "";
  SignUpController signUpController = SignUpController();
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        initialValue: sharedUser.name.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          isDense: true,
                          hintText: 'Enter your name',
                        ),
                        style: TextStyle(
                          color: ThemeManager.second,
                        ),
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.05,
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
                      TextFormField(
                        style: TextStyle(
                          color: ThemeManager.second,
                        ),
                        onChanged: (value) {
                          setState(() {
                            emailAddress = value;
                          });
                        },
                        initialValue: sharedUser.email.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.1#$&'*+-/=?^_ {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Enter valid Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          isDense: true,
                          hintText: 'Enter your email',
                        ),
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.05,
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
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            phoneNu = value;
                          });
                        },
                        initialValue: sharedUser.phone.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone must not be empty';
                          }
                          bool phoneExp = RegExp(r'^\d{10}$').hasMatch(value);
                          if (!phoneExp) {
                            return 'Phone number is not valid';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: ThemeManager.second,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeManager.primary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          isDense: true,
                          hintText: 'Enter your phone number',
                          hintStyle: TextStyle(
                            color: ThemeManager.second.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.085,
                      ),
                      Center(
                        child: OutlinedContainerWithShadow(
                          width: LayoutManager.widthNHeight0(context, 1) * 0.5,
                          height:
                              LayoutManager.widthNHeight0(context, 1) * 0.13,
                          onTap: () async {
                            if (FirebaseAuth
                                .instance.currentUser!.isAnonymous) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return showCustomAlertDialog(context,
                                      "you have to SiginIn First to Change your info !");
                                },
                              );
                            } else {
                              if (signUpController.formKey.currentState!
                                  .validate()) {
                                oldEmail = sharedUser.email.toString();
                                if (name == "") {
                                  name = sharedUser.name.toString();
                                }
                                if (emailAddress == "") {
                                  emailAddress = sharedUser.email.toString();
                                }
                                if (phoneNu == "") {
                                  phoneNu = sharedUser.phone.toString();
                                }

                                userService
                                    .updateUser(sharedUser.id.toString());
                                sharedUser.name = name;
                                sharedUser.email = emailAddress;
                                sharedUser.phone = phoneNu;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "User Info Updated Successfully")),
                                );
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: Center(
                            child: GradientText(
                              'Change Info',
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
