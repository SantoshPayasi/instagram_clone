// ignore_for_file: overridden_fields, annotate_overrides
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/features/domain/entities/posts/post_entity.dart';

class PostModel extends PostEntity {
  final String? postId;

  final String? creatorUid;
  final String? username;
  final String? description;
  final String? profileImageurl;
  final String? postImageUrl;
  final num? totalLikes;
  final List<String>? likes;
  final num? totalComments;
  final Timestamp? createdAt;

  const PostModel(
      {this.postId,
      this.creatorUid,
      this.username,
      this.description,
      this.profileImageurl,
      this.postImageUrl,
      this.totalLikes,
      this.likes,
      this.totalComments,
      this.createdAt})
      : super(
            postId: postId,
            creatorUid: creatorUid,
            username: username,
            description: description,
            postImageUrl: postImageUrl,
            profileImageurl: profileImageurl,
            likes: likes,
            totalComments: totalComments,
            totalLikes: totalLikes,
            createdAt: createdAt);

  factory PostModel.fromSnapshot(dynamic snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return PostModel(
      postId: snapShot["postId"],
      creatorUid: snapShot["creatorUid"],
      username: snapShot["username"],
      description: snapShot["description"],
      profileImageurl: snapShot["profileImageurl"],
      postImageUrl: snapShot["postImageUrl"],
      likes: snapShot["likes"],
      totalComments: snapShot["totalComments"],
      totalLikes: snapShot["totalLikes"],
      createdAt: snapShot["createdAt"],
    );
  }

  Map<String, dynamic> tojson() => {
            "postId": postId,
            "creatorId": creatorUid,
            "username": username,
            "description": description,
            "postImageUrl": postImageUrl,
            "profileImageurl": profileImageurl,
            "likes": likes,
            "totalComments": totalComments,
            "totalLikes": totalLikes,
            "createdAt": createdAt
      };
}
