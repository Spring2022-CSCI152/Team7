import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class androidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const androidAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      centerTitle: false,
      title: SvgPicture.asset(
        'assets/logo.svg',
        color: primaryColor,
        height: 32,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.messenger_outline,
          ),
        ),
      ],
    );
  }
}
