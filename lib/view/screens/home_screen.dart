import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/theme_manager.dart';
import 'package:tale/view/screens/MyHeaderDrawer.dart';
import 'package:tale/view/screens/cards_screen.dart';
import 'package:tale/view/screens/menu_screens/about_us.dart';
import 'package:tale/view/screens/menu_screens/change_info.dart';
import 'package:tale/view/screens/menu_screens/personal.dart';
import 'package:tale/view/screens/menu_screens/terms_use.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.card;
  late Widget container;
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
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: ThemeManager.primary),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/logo.png',
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
                Color(0xFF0A061C),
                Color(0xFF110A27),
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
            child: container,
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
      decoration: BoxDecoration(
        gradient: ThemeManager.sideMenu,
      ),
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.card ? true : false),
          menuItem(2, "Personal Details", Icons.people_alt_outlined,
              currentPage == DrawerSections.personal ? true : false),
          menuItem(3, "Change Info", Icons.event,
              currentPage == DrawerSections.change_info ? true : false),
          menuItem(4, "Terms of Use", Icons.notes,
              currentPage == DrawerSections.terms ? true : false),
          menuItem(5, "About Us", Icons.settings_outlined,
              currentPage == DrawerSections.about ? true : false),
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
          selected ? ThemeManager.second.withOpacity(0.6) : Colors.transparent,
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
}

enum DrawerSections {
  card,
  personal,
  change_info,
  terms,
  about,
}
