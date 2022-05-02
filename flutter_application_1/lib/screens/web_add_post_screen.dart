import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/resources/firestore_methods.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../widgets/web_appbar.dart';

import '../utils/utils.dart';

void main() => runApp(WebAddPost());

class WebAddPost extends StatefulWidget {
  WebAddPost({Key? key}) : super(key: key);
  @override
  State<WebAddPost> createState() => _WebAddPost();
}

class _WebAddPost extends State<WebAddPost> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );

      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        showSnackBar('Posted!', context);
        clearImage();
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a post'),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(
                  ImageSource.camera,
                );
                setState(
                  () {
                    _file = file;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(
                  ImageSource.gallery,
                );
                setState(
                  () {
                    _file = file;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.upload),
                onPressed: () => _selectImage(context),
              ),
            ),
          )
        : Scaffold(
            appBar: webAppBar(),
            backgroundColor: webBackgroundColor,
            body: Column(
              children: [
                _isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(
                        padding: EdgeInsets.only(top: 0),
                      ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*
                    Column(
                      children: [
                        CircleAvatar(
                      backgroundImage: NetworkImage(
                        userProvider.getUser.photoUrl,
                      ),
                    ),
                      ],
                    )
                  */

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: TextField(
                                style: TextStyle(color: primaryColor),
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: primaryColor),
                                  hintText: 'Write a caption...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 4,
                                      color: blueColor,
                                    ),
                                  ),
                                ),
                                maxLines: 8,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              /*
                         onPressed: () => postImage(
                         userProvider.getUser.uid,
                         userProvider.getUser.username,
                         userProvider.getUser.photoUrl,),*/
                              style:
                                  ElevatedButton.styleFrom(primary: blueColor),
                              child: const Text(
                                'Post',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: AspectRatio(
                            aspectRatio: 487 / 451,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill,
                                  //alignment: FractionalOffset.center,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
          );
  }
}
