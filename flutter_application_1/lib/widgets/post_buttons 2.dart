import 'package:flutter/material.dart';

// Button
class Button extends StatelessWidget {
  Button(
      {required this.onTap,
      required this.buttonText,
      this.buttonColor,
      required this.buttonW,
      Key? key})
      : super(key: key);

  String buttonText;
  Color? buttonColor;
  VoidCallback onTap;
  double buttonW;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: buttonColor ?? Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.favorite_outline),
          SizedBox(width: buttonW),
          Text(buttonText),
        ],
      ),
      onPressed: onTap,
    );
  }
}

//Comment Button
class CommentButton extends StatelessWidget {
  CommentButton(
      {required this.onTap,
      required this.buttonText,
      this.borderRadius,
      this.buttonColor,
      required this.buttonW,
      Key? key})
      : super(key: key);

  String buttonText;
  Color? buttonColor;
  VoidCallback onTap;
  double? borderRadius;
  double buttonW;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: buttonColor ?? Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.comment_outlined),
          SizedBox(width: buttonW),
          Text(buttonText),
        ],
      ),
      onPressed: onTap,
    );
  }
}

//Settings Button
class SettingsButton extends StatelessWidget {
  SettingsButton({required this.onTap, Key? key}) : super(key: key);

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: onTap,
    );
  }
}
