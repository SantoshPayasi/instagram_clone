// ignore_for_file: overridden_fields, annotate_overrides

import '../../../domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
 
  final String? uid;
  final String? username;
  final String? name;
  final String? bio;
  final String? email;
  final String? profileUrl;
  final List? followers;
  final List? following;
  final num? posts;
  final num? totalFollowing;
  final num? totalFollowers;
  final String? website;

  UserModel(
      {
        this.uid,
      this.username,
      this.name,
      this.bio,
      this.email,
      this.profileUrl,
      this.followers,
      this.following,
      this.posts,
      this.totalFollowing,
      this.totalFollowers,
      this.website
      }):super(
    uid: uid,
    totalFollowers: totalFollowers,
    totalFollowing: totalFollowing,
    followers: followers,
    following: following,
    username: username,
    name:name,
    email:email,
    profileUrl: profileUrl,
    bio:bio,
    website:website,
    posts:posts
  );

  factory UserModel.fromSnapshot(dynamic snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      name:snapshot['name'],
      username:snapshot['username'],
      email:snapshot['email'],
      bio:snapshot['bio'],
      website:snapshot['website'],
      totalFollowers:snapshot['totalFollowers'],
      totalFollowing:snapshot['totalFollowing'],
      posts:snapshot['posts'],
      profileUrl:snapshot['profileUrl'],
      followers: List.from(snap.get("followers")),
      following: List.from(snap.get("following")),
      uid:snapshot['uid'],
    );
  }

  Map<String, dynamic> toJson()=>{
    "uid":uid,
    "email":email,
    "username":username,
    "name":name,
    "profileUrl":profileUrl,
    "website":website,
    "totalFollowers":totalFollowers,
    "totalFollowing":totalFollowing,
    "posts":posts,
    "following":following,
    "followers":followers,
     "bio":bio
  };
}
