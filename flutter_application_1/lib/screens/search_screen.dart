import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/search_widgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          controller: searchController,
          decoration: const InputDecoration(labelText: 'Search for a user'),
          onFieldSubmitted: (String _) {
            setState(() {
              isShowUsers = true;
            });
          },
        ),
      ),
      body: isShowUsers
          ? searchDisplay(searchController: searchController)
          : searchLayout(),
    );
  }
}
