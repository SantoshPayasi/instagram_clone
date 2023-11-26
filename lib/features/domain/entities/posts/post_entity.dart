import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
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

  const PostEntity(
      this.postId,
      this.creatorUid,
      this.username,
      this.description,
      this.profileImageurl,
      this.postImageUrl,
      this.totalLikes,
      this.likes,
      this.totalComments,
      this.createdAt);

  @override

  List<Object?> get props => [
      postId,
      creatorUid,
      username,
      description,
      profileImageurl,
      postImageUrl,
      totalLikes,
      likes,
      totalComments,
      createdAt
  ];
}
