import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/screens/comments_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../resources/firestore_methods.dart';

class PostCardWeb extends StatefulWidget {
  final snap;
  const PostCardWeb({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCardWeb> createState() => _PostCardState();
}

class _PostCardState extends State<PostCardWeb> {
  bool isLikeAnimating = false;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();

      commentLen = snap.docs.length;
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Container(
        width: 650.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(33, 255, 254, 254),
        ),
        child: Column(
          children: [
            //header section
            Container(
              width: 650,
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ).copyWith(right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                ),
                color: Colors.yellow,
              ),
              // Profile picture and settings button
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      widget.snap['profImage'],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.snap['username'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Setting button
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            shrinkWrap: true,
                            children: [
                              'Delete',
                            ]
                                .map(
                                  (e) => InkWell(
                                    onTap: () async {
                                      FirestoreMethods()
                                          .deletePost(widget.snap['postId']);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            // //Image Section
            // GestureDetector(
            //   //like Inkwell but more animation features
            //   onDoubleTap: () async {
            //     await FirestoreMethods().likePost(
            //       widget.snap['postId'],
            //       user.uid,
            //       widget.snap['likes'],
            //     );
            //     setState(() {
            //       isLikeAnimating = true;
            //     });
            //   },
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       SizedBox(
            //         // height: MediaQuery.of(context).size.height * 0.35,
            //         // width: double.infinity,
            //         height: 450,
            //         child: Image.network(
            //           widget.snap['postUrl'],
            //           // fit: BoxFit.cover,
            //         ),
            //       ),
            //       // AnimatedOpacity(
            //       //   //to make sure the like animation only shows up when true
            //       //   duration: const Duration(
            //       //     milliseconds: 200,
            //       //   ),
            //       //   opacity: isLikeAnimating ? 1 : 0,
            //       //   child: LikeAnimation(
            //       //     child: const Icon(
            //       //       Icons.favorite,
            //       //       color: Colors.white,
            //       //       size: 120,
            //       //     ),
            //       //     isAnimating: isLikeAnimating,
            //       //     duration: const Duration(
            //       //       milliseconds: 400,
            //       //     ),
            //       //     onEnd: () {
            //       //       setState(() {
            //       //         isLikeAnimating = false;
            //       //       });
            //       //     },
            //       //   ),
            //       // )
            //     ],
            //   ),
            // ),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.35,
                  // width: double.infinity,
                  height: 450,
                  child: Image.network(
                    widget.snap['postUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            //Like Comment section
            Container(
              width: 650,
              child: Row(
                children: [
                  LikeAnimation(
                    isAnimating: widget.snap['likes'].contains(user.uid),
                    smallLike: true,
                    child: IconButton(
                      onPressed: () async {
                        await FirestoreMethods().likePost(
                          widget.snap['postId'],
                          user.uid,
                          widget.snap['likes'],
                        );
                      },
                      icon: widget.snap['likes'].contains(user.uid)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                            ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                          snap: widget.snap,
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Description and Comments
            Container(
              width: 650,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                    child: Text(
                      '${widget.snap['likes'].length} likes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                            text: widget.snap['username'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' ${widget.snap['description']}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        'View all $commentLen comments',
                        style: const TextStyle(
                          fontSize: 16,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap['datePublished'].toDate()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
