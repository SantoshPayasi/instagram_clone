// ignore_for_file: file_names, deprecated_member_use, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constInfo.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/cridentials/cridential_cubit.dart';
import 'package:instagram_clone/features/presentation/pages/main/main_screen.dart';
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
  bool _issigningIn = false;
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
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (state is CredentialFailure) {
            toast("Invaid email and password");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if (state is Authenticated) {
                return MainScreen(uid: state.uid);
              } else {
                return _bodyWidget();
              }
            });
          } else {
            return _bodyWidget();
          }
        },
      ),
    );
  }

  _bodyWidget() {
    return Container(
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
              _signInUser();
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
              Navigator.pushNamedAndRemoveUntil(
                  context, PageRoutes.signUpScreen, (route) => false);
            },
            navigationTitle: "SignUp Now",
          ),
          _issigningIn
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
    );
  }

  void _signInUser() {
    setState(() {
      _issigningIn = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signInUser(_email.text, _password.text)
        .then((value) => {_clear()});
  }

  _clear() {
    setState(() {
      _issigningIn = false;
      _email.clear();
      _password.clear();
    });
  }
}
