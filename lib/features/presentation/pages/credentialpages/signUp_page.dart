// ignore_for_file: file_names, depend_on_referenced_packages, deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signIn_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
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
            const Stack(
              children: [
                CircleAvatar(
                  backgroundColor: DesignColors.primaryColor,
                  radius: 30,
                  child: Icon(
                    Icons.person_rounded,
                    color: DesignColors.secondryColor,
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: DesignColors.blueColor,
                    size: 20,
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
                if (kDebugMode) {
                  print("SignUp is called");
                }
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
            )
          ],
        ),
      ),
    );
  }
}
