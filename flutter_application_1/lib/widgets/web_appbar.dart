import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'web_appbar_widgets.dart';

class webAppBar extends StatelessWidget implements PreferredSizeWidget {
  const webAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    int _page = 0;

    return AppBar(
      title: Text("Mepo"),
      actions: <Widget>[
        webAppbarBtn(
          toolTitle: 'Search Page',
          iconType: Icons.search,
          color: (_page == 1) ? primaryColor : secondaryColor,
        ),
        webAppbarBtn(
          toolTitle: 'Create Post',
          iconType: Icons.add_box_outlined,
          color: (_page == 2) ? primaryColor : secondaryColor,
        ),
        webAppbarBtn(
          toolTitle: 'Favorites Page',
          iconType: Icons.favorite,
          color: (_page == 3) ? primaryColor : secondaryColor,
        ),
        webAppbarBtn(
          toolTitle: 'Profile Page',
          iconType: Icons.account_circle_outlined,
          color: (_page == 4) ? primaryColor : secondaryColor,
        ),
        webAppbarBtn(
          toolTitle: 'Home Page',
          iconType: Icons.home,
          color: (_page == 0) ? primaryColor : secondaryColor,
        ),
      ],
      backgroundColor: webBackgroundColor,
      bottom: bottomAppBar(),
    );
  }
}
