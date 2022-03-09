import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';
import '../widgets/post_buttons.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Row(
          children: [
            // Container(
            //   color: Color.fromARGB(171, 18, 100, 100),
            //   child: Column(
            //     children: [
            //       SvgPicture.asset(
            //         'assets/logo.svg',
            //         color: homeColor,
            //         height: 64,
            //       ),
            //       Text('This is web'),
            //     ],
            //   ),
            // ),
            Column(
              children: [
                Container(
                  width: 500.0,
                  height: 600.0,
                  color: Colors.black38,
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.all(60.0),
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
                                        color:
                                            Color.fromARGB(146, 68, 137, 255),
                                        child: LikeButton(),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 20, 20, 20),
                                        padding: EdgeInsets.all(10),
                                        color:
                                            Color.fromARGB(146, 68, 137, 255),
                                        child: CommentButton(),
                                      ),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        //padding: EdgeInsets.all(10),
                                        color:
                                            Color.fromARGB(146, 68, 137, 255),
                                        child: SettingsButton(),
                                      ),
                                    ],
                                  ),
                                ),
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
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
          ],
        ),
      ),
    );
  }
}
