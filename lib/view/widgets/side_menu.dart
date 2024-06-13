import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Legal'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Drawer Example',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
