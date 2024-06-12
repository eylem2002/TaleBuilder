import 'package:flutter/material.dart';
import 'package:tale/core/models/user_model.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/widgets/sign_form_filde.dart';

//page to create a new account in the app
class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  late SignUpController signUpController;
  UserService _service = UserService();

  bool flag = false;

  @override
  void initState() {
    super.initState();
    signUpController = SignUpController();
  }

  @override
  void dispose() {
    signUpController.firstName.dispose();
    signUpController.email.dispose();
    signUpController.phone.dispose();
    signUpController.password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
        child: Form(
          key: signUpController.formKey,
          child: SizedBox(
            height: LayoutManager.widthNHeight0(context, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.23,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientText(
                          'TaleBuilder',
                          gradient: ThemeManager.title,
                          style: TextStyle(
                              fontSize:
                                  LayoutManager.widthNHeight0(context, 1) *
                                      0.085,
                              fontWeight: FontWeight.bold,
                              fontFamily: ThemeManager.fontFamily),
                        ),
                        SizedBox(
                          height: LayoutManager.widthNHeight0(context, 1) * 0.1,
                        ),
                        TextFormFieldWidgetSign(
                            passToggle: false,
                            passController: signUpController.firstName,
                            labelText: 'Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Your Name must not be empty ';
                              }
                              return null;
                            },
                            str: ''),
                        SizedBox(
                          height:
                              LayoutManager.widthNHeight0(context, 1) * 0.07,
                        ),
                        TextFormFieldWidgetSign(
                            passToggle: false,
                            passController: signUpController.email,
                            labelText: 'Email Address',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty ';
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.1#$&'*+-/=?^_ {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return "Enter valid Email";
                              }
                              return null;
                            },
                            str: ''),
                        SizedBox(
                          height:
                              LayoutManager.widthNHeight0(context, 1) * 0.07,
                        ),
                        TextFormFieldWidgetSign(
                            passToggle: false,
                            passController: signUpController.phone,
                            labelText: 'Phone',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone must not be empty ';
                              }
                              bool phoneExp =
                                  RegExp(r'^\d{10}$').hasMatch(value);

                              if (!phoneExp) {
                                return 'Phone number is not valid ';
                              }

                              return null;
                            },
                            str: ''),
                        SizedBox(
                          height:
                              LayoutManager.widthNHeight0(context, 1) * 0.07,
                        ),
                        TextFormFieldWidgetSign(
                            passToggle: true,
                            passController: signUpController.password,
                            labelText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty ';
                              }
                              if (value.length < 7) {
                                return "Password length should be more than 7 characters";
                              }
                              return null;
                            },
                            str: '')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.08,
                  ),
                  Center(
                    child: SizedBox(
                      width: LayoutManager.widthNHeight0(context, 1) * 0.55,
                      height: LayoutManager.widthNHeight0(context, 0) * 0.06,
                      child: InkWell(
                        onTap: () async {
                          if (signUpController.formKey.currentState!
                              .validate()) {
                            final user = UserModel(
                              name: signUpController.firstName.text,
                              email: signUpController.email.text,
                              phone: signUpController.phone.text,
                            );

                            _signUp(
                                context, user, signUpController.password.text);
                          }
                        },
                        child: Container(
                          height: LayoutManager.widthNHeight0(context, 0) * .07,
                          decoration: BoxDecoration(
                              color: ThemeManager.primary,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: ThemeManager.second,
                                  fontSize: 20,
                                  fontFamily: ThemeManager.fontFamily,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .033,
                            fontFamily: ThemeManager.fontFamily,
                            color: Colors.grey[600]),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(signInScreen);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .033,
                                fontFamily: ThemeManager.fontFamily,
                                color: Colors.grey[700]),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void _signUp(BuildContext context, UserModel user, String password) async {
    String str = await _service.addUser(user, password);

    if (str == "Done") {
      print("User is successfully created");

      if (mounted) {
        Navigator.of(context).pushReplacementNamed(signInScreen);
      }
    } else {
      print("Error occurred during sign up");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              str,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: '',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    }
  }
}

class SignUpController {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _secondName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  set formKey(value) {
    _formKey = value;
  }

  TextEditingController get phone => _phone;

  set phone(TextEditingController value) {
    _phone = value;
  }

  TextEditingController get password => _password;

  set password(TextEditingController value) {
    _password = value;
  }

  TextEditingController get secondName => _secondName;

  set secondName(TextEditingController value) {
    _secondName = value;
  }

  TextEditingController get firstName => _firstName;

  set firstName(TextEditingController value) {
    _firstName = value;
  }

  TextEditingController get email => _email;

  set email(TextEditingController value) {
    _email = value;
  }
}
