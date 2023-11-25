// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/pages/Home/comment_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Home/editPostScreen.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/profile_edit_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/profile_screen.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signIn_page.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signUp_page.dart';
import "package:lottie/lottie.dart";

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings setting) {
    // ignore: unused_local_variable
    final args = setting.arguments;
    switch (setting.name) {
      case PageRoutes.profileScreen:
        {
          return routeBuilding(ProfileScreen());
        }
      case PageRoutes.editProfileScreen:
        {
          if (args is UserEntity) {
            return routeBuilding(EditProfileScreen(
              user: args,
            ));
          } else {
            return routeBuilding(NotFoundPage());
          }
        }
      case PageRoutes.editPostScreen:
        {
          return routeBuilding(EditPostScreen());
        }
      case PageRoutes.signInScreen:
        {
          return routeBuilding(SigninPage());
        }
      case PageRoutes.signUpScreen:
        {
          return routeBuilding(SignupPage());
        }
      case PageRoutes.commentScreen:
        {
          return routeBuilding(CommentScreen());
        }
      default:
        {
          return routeBuilding(NotFoundPage());
        }
    }
  }
}

MaterialPageRoute routeBuilding(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.primaryColor,
      body: Center(
          child: LottieBuilder.network(
        "https://lottie.host/5a70fd62-9869-4d2b-b8ec-e2080a2e2164/EptpTKdFhR.json",
      )),
    );
  }
}
