// ignore_for_file: file_names
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:fluttertoast/fluttertoast.dart";
class DesignColors {
  static const backgroundColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const blueColor = Color.fromRGBO(0, 149, 246, 1);
  static const primaryColor = Colors.white;
  static const secondryColor = Colors.grey;
  static const darkGreyColor = Color.fromRGBO(97, 97, 97, 1);
  static final TextStyle fontStyle = GoogleFonts.poppins();
}

class FirebaseConst{
  static const String users = "users";
  static const String post = "posts";
  static const String comment = "comments";
  
  static const String reply = "reply";
}

void toast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: DesignColors.blueColor,
     textColor: DesignColors.primaryColor,
     fontSize: 16.0
  );
}

Widget widthBox(double width) {
  return SizedBox(
    width: width,
  );
}

Widget heightBox(double height) {
  return SizedBox(height: height);
}


class PageRoutes{
  static const editProfileScreen = "editProfileScreen";
  static const editPostScreen = "editPostScreen";
  static const profileScreen = "profileScreen";
  static const commentScreen = "commentScreen";
  static const signInScreen = "signInScreen";
  static const signUpScreen = "signUpScreen";
}