// ignore_for_file: file_names, deprecated_member_use, depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:instagram_clone/features/presentation/pages/credentialpages/signUp_page.dart';
import 'package:instagram_clone/features/presentation/widgets/formInputfield.dart';

import '../../widgets/bottomNavigationSection.dart';
import '../../widgets/submitButton.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
            heightBox(30),
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
            SubmitButton(
              onTapAction: () {
                if (kDebugMode) {
                  print("SignIn is called");
                }
              },
              lable: "Sign In",
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Divider(
              color: DesignColors.darkGreyColor,
            ),
            BootomNavigationWidget(
              lable: "Don't have any account?",
              navigationFunction: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                    (route) => false);
              },
              navigationTitle: "SignUp Now",
            )
          ],
        ),
      ),
    );
  }
}
