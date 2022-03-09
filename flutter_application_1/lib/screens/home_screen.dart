import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mepo', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Mepo'),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              icon: Icon(Icons.account_circle_outlined),
              tooltip: 'Profile Page',
              onPressed: () {}),
        ],
        backgroundColor: webBackgroundColor,
      ),
      body: Container(),
    );
  }
}
