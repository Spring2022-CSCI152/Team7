import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/web_screen_layout.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/post_buttons.dart';
import 'package:flutter_application_1/widgets/post_card.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mepo Home Page', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('post').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
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
