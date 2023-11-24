// ignore_for_file: file_names, depend_on_referenced_packages, deprecated_member_use, invalid_use_of_visible_for_testing_member
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/cridentials/cridential_cubit.dart';
import 'package:instagram_clone/features/presentation/pages/main/main_screen.dart';
import 'package:instagram_clone/features/presentation/widgets/ProfilePic_widget.dart';
import '../../../../constInfo.dart';
import '../../widgets/bottomNavigationSection.dart';
import '../../widgets/formInputfield.dart';
import '../../widgets/submitButton.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  bool isSigningUp = false;
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DesignColors.backgroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, state) {
            if (state is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if (state is CredentialFailure) {
              toast("Invalid email and password");
            }
          },
          builder: (context, state) {
            if (state is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return MainScreen(uid: authState.uid);
                  } else {
                    return _bodyWiget();
                  }
                },
              );
            } else {
              return _bodyWiget();
            }
          },
        ));
  }

  _bodyWiget() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              "assets/logo.svg",
              color: DesignColors.primaryColor,
            ),
            Stack(
              children: [
                profilePic(file: file, imageUrl: ""),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      _selectImage();
                    },
                    child: const Icon(
                      Icons.add_a_photo_rounded,
                      color: DesignColors.blueColor,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            heightBox(30),
            FormInputFields(
              fieldController: _username,
              lable: "Username",
              hintText: "Enter your username",
            ),
            heightBox(10),
            FormInputFields(
              fieldController: _email,
              lable: "Email",
              hintText: "Enter your Email",
            ),
            heightBox(10),
            FormInputFields(
              fieldController: _password,
              lable: "Password",
              hintText: "Enter your Password",
              isPassword: true,
            ),
            heightBox(10),
            FormInputFields(
              fieldController: _bio,
              lable: "Bio",
              hintText: "Enter your bio",
            ),
            heightBox(10),
            SubmitButton(
              onTapAction: () {
                _signUpUser();
              },
              lable: "Register Now",
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Divider(
              color: DesignColors.darkGreyColor,
            ),
            BootomNavigationWidget(
              lable: "Already have any account?",
              navigationFunction: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, PageRoutes.signInScreen, (route) => false);
              },
              navigationTitle: "SignIn Now",
            ),
            isSigningUp
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please wait",
                        style: DesignColors.fontStyle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      widthBox(10),
                      const CircularProgressIndicator()
                    ],
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  )
          ],
        ),
      ),
    );
  }

  void _signUpUser() {

    setState(() {
      isSigningUp = true;
    });
    UserEntity user = UserEntity(
        email: _email.text,
        passwords: _password.text,
        username: _username.text,
        bio: _bio.text,
        name: "",
        totalFollowers: 0,
        totalFollowing: 0,
        profileUrl: "",
        posts: 0,
        followers: const [],
        following: const [],
        website: "",
        otherUid: "",
        imageFile: file
        );
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(user)
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _username.clear();
      _email.clear();
      _password.clear();
      _bio.clear();
      isSigningUp = false;
    });
  }

  Future<void> _selectImage() async {
    try {
      final imageFile = await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);
      if (imageFile != null) {
        setState(() {
          file = File(imageFile.path);
        });
      } else {
        toast("No image is selected");
      }
    } catch (e) {
      toast(e.toString());
    }
  }
}
