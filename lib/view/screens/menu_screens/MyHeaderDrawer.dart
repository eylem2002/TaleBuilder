import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/shared.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _setGreeting();
  }

  void _setGreeting() {
    DateTime now = DateTime.now();
    if (now.hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (now.hour < 18) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  _greeting,
                  style: TextStyle(
                    letterSpacing: 4,
                    color: ThemeManager.textColor,
                    fontFamily: ThemeManager.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: LayoutManager.widthNHeight0(context, 1) * 0.05,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(
                      left: LayoutManager.widthNHeight0(context, 1) * 0.045),
                  child: Text(
                    "Hi ${sharedUser.name} !".toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: ThemeManager.textColor,
                      fontFamily: ThemeManager.fontFamily,
                      fontSize: LayoutManager.widthNHeight0(context, 1) * 0.048,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
