import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tale/core/services/user_service.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: ThemeManager.sideMenu,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: LayoutManager.widthNHeight0(context, 1) * 0.44,
              decoration: BoxDecoration(gradient: ThemeManager.sideTopMenu),
              child: Padding(
                padding: EdgeInsets.only(
                  left: LayoutManager.widthNHeight0(context, 1) * 0.04,
                  top: LayoutManager.widthNHeight0(context, 1) * 0.14,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontFamily: ThemeManager.fontFamily,
                            fontSize:
                                LayoutManager.widthNHeight0(context, 1) * 0.048,
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(
                              left: LayoutManager.widthNHeight0(context, 1) *
                                  0.045),
                          child: Text(
                            'Anders Booker',
                            style: TextStyle(
                              color: ThemeManager.textColor,
                              fontFamily: ThemeManager.fontFamily,
                              fontSize:
                                  LayoutManager.widthNHeight0(context, 1) *
                                      0.048,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: LayoutManager.widthNHeight0(context, 1) * 0.048,
                ),
                children: <Widget>[
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    text: 'Home',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.person,
                    text: 'Personal Details',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.change_circle_outlined,
                    text: 'Change Info',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.edit_document,
                    text: 'Terms of Use',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info,
                    text: 'About Us',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout_rounded,
                    text: 'Sign Out',
                    onTap: () async {
                      await userService.signOut();

                      print("sign out");

                      Navigator.of(context).pushReplacementNamed(signInScreen);
                    },
                  ),
                  SizedBox(
                    height: LayoutManager.widthNHeight0(context, 1) * 0.3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildSocialIcon(
                        FontAwesomeIcons.instagram,
                        'Instagram',
                        LayoutManager.widthNHeight0(context, 1) * 0.1,
                      ),
                      SizedBox(width: 20),
                      _buildSocialIcon(
                        FontAwesomeIcons.xTwitter,
                        'Twitter',
                        LayoutManager.widthNHeight0(context, 1) * 0.1,
                      ),
                      SizedBox(width: 20),
                      _buildSocialIcon(
                        FontAwesomeIcons.linkedin,
                        'LinkedIn',
                        LayoutManager.widthNHeight0(context, 1) * 0.1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String text,
      Widget? trailing,
      GestureTapCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: ThemeManager.textColor),
      title: Text(
        text,
        style: TextStyle(
          color: ThemeManager.textColor,
          fontFamily: ThemeManager.fontFamily,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip, double size) {
    return IconButton(
      iconSize: size,
      icon: Icon(icon, color: ThemeManager.textColor),
      tooltip: tooltip,
      onPressed: () {},
    );
  }
}
