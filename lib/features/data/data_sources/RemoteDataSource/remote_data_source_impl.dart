// ignore_for_file: depend_on_referenced_packages

import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/data/data_sources/RemoteDataSource/remote_data_source.dart';
import 'package:instagram_clone/features/data/models/user/user_model.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource{
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDataSourceImpl({required this.firebaseFirestore, required this.firebaseAuth});
  @override
  Future<void> createUser(UserEntity user) async{
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    final uid = await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc)  {
     final newUser = UserModel(
        uid: uid,
        name:user.name,
        email:user.email,
        profileUrl:user.profileUrl,
        website: user.website,
        totalFollowers: user.totalFollowers,
        totalFollowing: user.totalFollowing,
        posts: user.posts,
        bio:user.bio,
        username: user.username,
        following: user.following,
        followers: user.followers
    ).toJson();

     if(!userDoc.exists){
       userCollection.doc(uid).set(newUser);
     }else{
       userCollection.doc(uid).update(newUser);
     }
    }).catchError((error){
      toast("Some error is occurred");
    });

  }

  @override
  Future<String> getCurrentUid() async=>firebaseAuth.currentUser!.uid;

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
   final userCollection = firebaseFirestore.collection(FirebaseConst.users).where("uid", isEqualTo: uid).limit(1);
   return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isSignIn() async =>firebaseAuth.currentUser!.uid != null ? true :false;

  @override
  Future<void> signInUser(UserEntity user) => throw UnimplementedError();

  @override
  Future<void> signOut() => firebaseAuth.signOut();

  @override
  Future<void> signUpUser(UserEntity user) => throw UnimplementedError();

  @override
  Future<void> updateUser(UserEntity user) => throw UnimplementedError();

}