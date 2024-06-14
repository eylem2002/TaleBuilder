import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/MyHeaderDrawer.dart';
import 'package:tale/view/screens/Signin/up/signin.dart';
import 'package:tale/view/screens/cards_screen.dart';
import 'package:tale/view/screens/menu_screens/about_us.dart';
import 'package:tale/view/screens/menu_screens/change_info.dart';
import 'package:tale/view/screens/menu_screens/personal.dart';
import 'package:tale/view/screens/menu_screens/terms_use.dart';
import 'package:tale/view/widgets/dialogAlert.dart';

class sideBar extends StatefulWidget {
  @override
  _sideBarState createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  var currentPage = DrawerSections.card;
  late Widget container;
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    if (currentPage == DrawerSections.card) {
      container = CardsScreen();
    } else if (currentPage == DrawerSections.personal) {
      container = PersonalDetailsScreen();
    } else if (currentPage == DrawerSections.change_info) {
      container = ChangeInfo();
    } else if (currentPage == DrawerSections.terms) {
      container = TermsScreen();
    } else if (currentPage == DrawerSections.about) {
      container = AboutUsScreen();
    } else if (currentPage == DrawerSections.signout) {
      // Placeholder for sign out logic, should not show any container
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: ThemeManager.dark),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/blue.png',
              fit: BoxFit.contain,
            ),
            onPressed: () {
              //back
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF071223),
                Color(0xFF071526),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
          Positioned.fill(
            child:
                container ?? Container(), // Use container or empty Container()
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      width: double.infinity,
      height: LayoutManager.widthNHeight0(context, 1) * 1.8,
      decoration: BoxDecoration(
        gradient: ThemeManager.sideMenu,
      ),
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.card ? true : false),
          menuItem(2, "Personal Details", Icons.people_alt_outlined,
              currentPage == DrawerSections.personal ? true : false),
          menuItem(3, "Change Info", Icons.change_circle,
              currentPage == DrawerSections.change_info ? true : false),
          menuItem(4, "Terms of Use", Icons.notes,
              currentPage == DrawerSections.terms ? true : false),
          menuItem(5, "About Us", Icons.info,
              currentPage == DrawerSections.about ? true : false),
          menuItem(6, "Sign Out", Icons.logout,
              currentPage == DrawerSections.signout ? true : false),
          SizedBox(
            height: LayoutManager.widthNHeight0(context, 1) * 0.3,
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color:
          selected ? ThemeManager.white.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.card;
            } else if (id == 2) {
              currentPage = DrawerSections.personal;
            } else if (id == 3) {
              currentPage = DrawerSections.change_info;
            } else if (id == 4) {
              currentPage = DrawerSections.terms;
            } else if (id == 5) {
              currentPage = DrawerSections.about;
            } else if (id == 6) {
              // Sign out logic
              signOut();
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: ThemeManager.textColor,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: ThemeManager.textColor,
                  fontSize: 16,
                  fontFamily: ThemeManager.fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut() async {
    await userService.signOut();

    Navigator.of(context).pushReplacementNamed(signInScreen);
  }
}

enum DrawerSections { card, personal, change_info, terms, about, signout }
