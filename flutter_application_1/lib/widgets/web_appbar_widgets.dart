import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/web_appbar.dart';

class webAppbarBtn extends StatelessWidget {
  final String toolTitle;
  final IconData iconType;
  final Color color;

  const webAppbarBtn({
    Key? key,
    required this.iconType,
    required this.toolTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(iconType),
        tooltip: toolTitle,
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 16),
        //Set onpressed to a dyanmic location
        onPressed: () {});
  }
}

class bottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const bottomAppBar({
    Key? key,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Container(
          color: blueColor,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0));
  }
}
