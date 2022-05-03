import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/resources/firestore_methods.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentWeb extends StatefulWidget {
  final snap;
  CommentWeb({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentWeb> createState() => _CommentWebState();
}

class _CommentWebState extends State<CommentWeb> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      width: 800.0,
      height: 500.0,
      child: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.snap['postId'])
                .collection('comments')
                .orderBy(
                  'datePublished',
                  descending: true,
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: (snapshot.data! as dynamic)
                    .docs
                    .length, //has to be confirmed from time to time (potential bug area)
                itemBuilder: (context, index) => CommentCard(
                    snap: (snapshot.data! as dynamic).docs[index].data()),
              );
            },
          ),
          Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoUrl),
                  radius: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8.0),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Comment as ${user.username}',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await FirestoreMethods().postComment(
                      widget.snap['postId'],
                      _commentController.text,
                      user.uid,
                      user.username,
                      user.photoUrl,
                    );
                    setState(
                      () {
                        _commentController.text = "";
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: blueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: 550,
    //   width: 900,
    //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    //   child: Row(
    //     children: [
    //       SizedBox(
    //         width: 500,
    //         child: Column(
    //           children: [
    //             Image.asset(
    //               "assets/sample.jpg",
    //               height: 400,
    //               width: 500,
    //               fit: BoxFit.fill,
    //             ),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Expanded(
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.vertical,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         //child: CommentCard(),
    //         padding: EdgeInsets.only(
    //           left: 20,
    //           right: 10,
    //         ),
    //         child: Column(
    //           children: [
    //             Text("User1"),
    //             Text("User2"),
    //             Text("User3"),
    //             Text("User4"),
    //             Text("User5"),
    //             Text("User6"),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
