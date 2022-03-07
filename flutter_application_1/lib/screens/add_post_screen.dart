import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: () {},
      ),
    );
  }
}
