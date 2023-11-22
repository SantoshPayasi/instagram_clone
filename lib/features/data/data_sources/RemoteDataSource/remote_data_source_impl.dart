// ignore_for_file: depend_on_referenced_packages

import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/data/data_sources/RemoteDataSource/remote_data_source.dart';
import 'package:instagram_clone/features/data/models/user/user_model.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import "package:firebase_storage/firebase_storage.dart";
import 'package:uuid/uuid.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  FirebaseRemoteDataSourceImpl(
      {required this.firebaseFirestore,
      required this.firebaseAuth,
      required this.firebaseStorage});
  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    final uid = await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              uid: uid,
              name: user.name,
              email: user.email,
              profileUrl: user.profileUrl,
              website: user.website,
              totalFollowers: user.totalFollowers,
              totalFollowing: user.totalFollowing,
              posts: user.posts,
              bio: user.bio,
              username: user.username,
              following: user.following,
              followers: user.followers,
              
              )
          .toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error is occurred");
    });
  }
  @override
  Future<void> createUserWithProfile(UserEntity user, String imageUrl) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    final uid = await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              uid: uid,
              name: user.name,
              email: user.email,
              profileUrl: imageUrl,
              website: user.website,
              totalFollowers: user.totalFollowers,
              totalFollowing: user.totalFollowing,
              posts: user.posts,
              bio: user.bio,
              username: user.username,
              following: user.following,
              followers: user.followers,
              
              )
          .toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error is occurred");
    });
  }

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore
        .collection(FirebaseConst.users)
        .where("uid", isEqualTo: uid)
        .limit(1);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isSignIn() async =>
      firebaseAuth.currentUser!.uid != null ? true : false;

  @override
  Future<void> signInUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.passwords!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.passwords!);
      } else {
        toast("Fields can not be empty");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toast("User not found");
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        toast("Wrong email or password");
      }
    }
  }

  @override
  Future<void> signOut() => firebaseAuth.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.passwords!.isNotEmpty) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: user.email!, password: user.passwords!)
            .then((value) async {
          if (value.user?.uid != null) {
            if (user.imageFile != null) {
              uploadImageToStorage(user.imageFile, false, value.user!.uid)
                  .then((profileUrl) => {
                    createUserWithProfile(user, profileUrl)
                  });
            }
            await createUserWithProfile(user, "");
          }
        });
        return;
      } else {
        toast("Fields are not valid");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toast("Email is already in use");
      } else {
        toast("Something went wrong");
      }
    }
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection("users");
    Map<String, dynamic> userInformation = Map();
    if (user.username != null && user.username != "") {
      userInformation["username"] = user.username;
    }
    if (user.name != null && user.name != "") {
      userInformation["name"] = user.name;
    }
    if (user.profileUrl != null && user.profileUrl != "") {
      userInformation["profileUrl"] = user.profileUrl;
    }
    if (user.bio != null && user.bio != "") {
      userInformation["bio"] = user.bio;
    }
    if (user.totalFollowers != null) {
      userInformation["totalFollowers"] = user.totalFollowers;
    }
    if (user.totalFollowing != null) {
      userInformation["totalFollowing"] = user.totalFollowing;
    }
    if (user.posts != null) {
      userInformation["posts"] = user.posts;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<String> uploadImageToStorage(
      File? file, bool isPost, String childName) async {
    Reference ref = firebaseStorage
        .ref()
        .child(childName)
        .child(firebaseAuth.currentUser!.uid);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    final uploadTask = ref.putFile(file!);
    final imageUrl =
        (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();
    return imageUrl;
  }
}
