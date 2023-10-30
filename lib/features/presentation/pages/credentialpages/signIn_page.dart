// ignore_for_file: file_names, deprecated_member_use, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:instagram_clone/features/presentation/widgets/formInputfield.dart';

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
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }
}
