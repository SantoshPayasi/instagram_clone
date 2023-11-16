import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
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
//  Not stored in db
  final String? passwords;
  final String? otherUid;

  UserEntity(
      {this.name,
      this.uid,
      this.email,
      this.followers,
      this.bio,
      this.following,
      this.otherUid,
      this.passwords,
      this.posts,
      this.profileUrl,
      this.totalFollowers,
      this.totalFollowing,
      this.username,
      this.website
      });

  @override
  List<Object?> get props => [
    name,
    uid,
    email,
    followers,
    bio,
    following,
    otherUid,
    passwords,
    posts,
    profileUrl,
    totalFollowers,
    totalFollowing,
    username
  ];
}
