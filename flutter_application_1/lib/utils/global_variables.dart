import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_post_screen.dart';

import '../screens/feed_Screen.dart';

const WebScreenSize = 600;

var homeScreenItems = [
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('notification'),
  Text('profile'),
];
