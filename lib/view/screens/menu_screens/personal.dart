import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/shared.dart';
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
      appBar: AppBar(
        title: Text("data"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
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
                      Divider(height: 1, color: Colors.grey[300]),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                        ),
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
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.008,
                      ),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: ThemeManager.fontFamily,
                        ),
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
                      SizedBox(
                        height: LayoutManager.widthNHeight0(context, 1) * 0.008,
                      ),
                      Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: ThemeManager.fontFamily,
                        ),
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
