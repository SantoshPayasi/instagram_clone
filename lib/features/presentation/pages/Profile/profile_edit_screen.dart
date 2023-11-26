// ignore_for_file: unnecessary_null_comparison, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/widget/profile_edit_form_widget.dart';
import '../../cubit/user/user_cubit.dart';
import '../../widgets/ProfilePic_widget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final UserEntity user;
  const EditProfileScreen({required this.user, super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController name;
  late final TextEditingController userName;
  late final TextEditingController bio;
  late final TextEditingController website;
  late File file;
  bool isUpdating = false;

  @override
  void initState() {
    name = TextEditingController(text: widget.user.name);
    userName = TextEditingController(text: widget.user.username);
    bio = TextEditingController(text: widget.user.bio);
    website = TextEditingController(text: widget.user.website);
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    userName.dispose();
    bio.dispose();
    website.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.clear_outlined,
                        size: 30,
                      )),
                  InkWell(
                      onTap: () {
                        _updateDetails();
                      },
                      child: const Icon(
                        Icons.check,
                        color: DesignColors.blueColor,
                        size: 30,
                      ))
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    profilePic(imageUrl: widget.user.profileUrl, file: file),
                    heightBox(20),
                    GestureDetector(
                      onTap: () {
                        _uploadImage();
                      },
                      child: Text(
                        "Please Upload Image",
                        style: DesignColors.fontStyle
                            .copyWith(color: DesignColors.blueColor),
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Column(
              children: [
                EditProfileForm(controller: name, lable: "Name"),
                heightBox(20),
                EditProfileForm(controller: userName, lable: "Username"),
                heightBox(20),
                EditProfileForm(controller: bio, lable: "Bio"),
                heightBox(20),
                EditProfileForm(controller: website, lable: "Website"),
                heightBox(30),
                isUpdating
                    ? const Row(
                        children: [
                          Text("Please wait..."),
                          CircularProgressIndicator()
                        ],
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      )
              ],
            ))
          ],
        ),
      ),
    );
  }

  void _uploadImage() async {
    try {
      final uploadedFile = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      if (uploadedFile == null) {
        toast("No images are uploaded");
      } else {
        setState(() {
          file = File(uploadedFile.path);
        });
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  void _updateDetails() {
    setState(() {
      isUpdating = true;
    });
    final user = UserEntity(
        uid: widget.user.uid,
        otherUid: widget.user.otherUid,
        name: name.text,
        username: userName.text,
        bio: bio.text,
        website: website.text,
        imageFile: file,
        profileUrl: widget.user.profileUrl,
        followers: widget.user.followers,
        following: widget.user.following,
        totalFollowers: widget.user.totalFollowers,
        totalFollowing: widget.user.totalFollowing,
        posts: widget.user.posts);
    BlocProvider.of<UserCubit>(context).updateUser(user).then((value) {
      setState(() {
        isUpdating = false;
      });
      _clear();
      Navigator.pop(context);
    });
  }

  void _clear() {
    name.clear();
    userName.clear();
    bio.clear();
    website.clear();
  }
}
