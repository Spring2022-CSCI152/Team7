import 'dart:html';

import 'package:flutter/gestures.dart';
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
      backgroundColor: webBackgroundColor,

      //Body for Add Post
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 600,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    //color: secondaryColor,
                    border: Border.all(
                      color: blueColor,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),

          //Just to Space out the two boxes
          SizedBox(
            width: 10,
          ),

          //Make Post Info
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 700,
                height: 600,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    //color: primaryColor,
                    border: Border.all(
                      color: blueColor,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // Text box for Title

                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 25.0, bottom: 15.0, left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: blueColor, width: 4.0),
                            ),
                            hintText: 'Title',
                            hintStyle: TextStyle(color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: blueColor, width: 4.0),
                            ),
                            hintText: 'About this post',
                            hintStyle: TextStyle(color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: blueColor, width: 4.0),
                            ),
                            hintText: 'Tags',
                            hintStyle: TextStyle(color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          child: Text(
                            'Post',
                          ),
                          color: blueColor,
                          textColor: primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
