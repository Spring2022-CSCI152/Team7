import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.username,
    required this.uid,
    required this.description,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "likes": likes,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
        'profImage': profImage
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      description: snapshot['description'],
      uid: snapshot['uid'],
      likes: snapshot['likes'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
    );
  }
}
