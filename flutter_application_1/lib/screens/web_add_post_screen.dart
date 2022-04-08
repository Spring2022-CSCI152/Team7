import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/web_screen_layout.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/post_buttons.dart';

void main() => runApp(WebAddPost());

class WebAddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mepo Home Page', home: MyAddPost());
  }
}

class MyAddPost extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mepo"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_circle_outlined),
              tooltip: 'Profile Page',
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {}),
        ],
        backgroundColor: webBackgroundColor,
        bottom: PreferredSize(
            child: Container(
              color: blueColor,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Row(
        children: [
          Container(
            color: blueColor,
            width: 150,
            height: 300,
          ),
          Container(
            width: 200,
            height: 400,
            color: blueColor,
          ),
        ],
      ),
/*
//Trying to Make it scrollable but Code from WebScreenLayout or ListView is not allowing it.
      body: Column(
        children: <Widget>[
          ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return WebScreenLayout();
              }),
        ],
      ),
*/
    );
  }
}
