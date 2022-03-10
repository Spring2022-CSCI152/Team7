import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mepo'),
          elevation: 0,
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 0.5 * MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Search...', border: OutlineInputBorder()),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(onPressed: () {}, child: Text('Album 1')),
                SizedBox(
                  width: 40,
                ),
                RaisedButton(onPressed: () {}, child: Text('Album 2')),
                SizedBox(
                  width: 40,
                ),
                RaisedButton(onPressed: () {}, child: Text('Album 3')),
                SizedBox(
                  width: 40,
                ),
                RaisedButton(onPressed: () {}, child: Text('Album 4')),
              ],
            )
          ],
        ));
  }
}
