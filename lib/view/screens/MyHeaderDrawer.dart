import 'package:flutter/material.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
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
                  'Good Morning',
                  style: TextStyle(
                    color: ThemeManager.textColor,
                    fontFamily: ThemeManager.fontFamily,
                    fontSize: LayoutManager.widthNHeight0(context, 1) * 0.048,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(
                      left: LayoutManager.widthNHeight0(context, 1) * 0.045),
                  child: Text(
                    'Anders Booker',
                    style: TextStyle(
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
