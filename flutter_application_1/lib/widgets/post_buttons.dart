import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/comment_web.dart';

//Like Button
class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.favorite_outline),
          SizedBox(width: 10.0),
          Text('Like'),
        ],
      ),
      onPressed: () {},
    );
  }
}

//Comment Button
class CommentButton extends StatelessWidget {
  const CommentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.comment_outlined),
          SizedBox(width: 10.0),
          Text('Comment'),
        ],
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: CommentWeb(),
          ),
        );
      },
    );
  }
}

//Settings Button
class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text("Edit"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Delete"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
