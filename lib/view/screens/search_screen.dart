import 'package:flutter/material.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            onPressed: () {
              ///back
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ThemeManager.background,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: ThemeManager.background,
        ),
        child: SingleChildScrollView(),
      ),
    );
  }
}
