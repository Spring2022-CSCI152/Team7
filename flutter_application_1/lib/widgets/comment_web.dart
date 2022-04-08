import 'package:flutter/material.dart';
import 'comment_card.dart';

class CommentWeb extends StatefulWidget {
  const CommentWeb({Key? key}) : super(key: key);

  @override
  State<CommentWeb> createState() => _CommentWebState();
}

class _CommentWebState extends State<CommentWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 900,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Image.asset(
                  "assets/sample.jpg",
                  height: 400,
                  width: 500,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
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
          Container(
            //child: CommentCard(),
            padding: EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: Column(
              children: [
                Text("User1"),
                Text("User2"),
                Text("User3"),
                Text("User4"),
                Text("User5"),
                Text("User6"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
