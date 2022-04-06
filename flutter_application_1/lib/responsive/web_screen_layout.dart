import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';
import '../widgets/post_buttons.dart';
import 'package:flutter_application_1/widgets/post_buttons.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: webBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Start of Expanded
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 500.0,
                    height: 40.0,
                    color: Colors.black38,
                    margin: EdgeInsets.only(top: 10.0),
                    child: (Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_circle_outlined),
                          color: Colors.white,
                        ),
                        Text(
                          "User_Mepo",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )),
                  ),
                  Container(
                    width: 500.0,
                    height: 600.0,
                    color: Colors.black38,
                    padding: EdgeInsets.all(25.0),
                    margin: EdgeInsets.only(
                        top: 5.0, bottom: 60.0, left: 60.0, right: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 450.0,
                              height: 300.0,
                              color: Colors.white10,
                              //margin: EdgeInsets.all(60.0),
                            ),
                            Container(
                              width: 450.0,
                              height: 230.0,
                              color: Colors.white10,
                              margin: EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    color: Colors.white, //delete later
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          padding: EdgeInsets.all(10),
                                          color: blueColor,
                                          child: LikeButton(
                                              onTap: () {},
                                              buttonText: 'Like',
                                              buttonW: 10.0),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0, 20, 20, 20),
                                          padding: EdgeInsets.all(10),
                                          color: blueColor,
                                          child: CommentButton(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text('Comment'),
                                                  ),
                                                );
                                              },
                                              buttonText: 'Comment',
                                              buttonW: 10.0),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          //padding: EdgeInsets.all(10),
                                          color: blueColor,
                                          child: SettingsButton(onTap: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Text Body of the Post
                                  Container(
                                    height: 150,
                                    padding: EdgeInsets.all(10),
                                    color: Colors.grey, //delete later
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Hello. This is Memo a respository application that can keep all of your favorite memories and thoughts for the world to know. Stay tuned for the finished product.",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
//End of Expanded
          ],
        ),
      ),
    );
  }
}
