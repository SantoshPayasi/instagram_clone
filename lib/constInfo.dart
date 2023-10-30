// ignore_for_file: file_names
import "package:flutter/material.dart";

class DesignColors {
  static const backgroundColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const blueColor = Color.fromRGBO(0, 149, 246, 1);
  static const primaryColor = Colors.white;
  static const secondryColor = Colors.grey;
  static const darkGreyColor = Color.fromRGBO(97, 97, 97, 1);
}

Widget widthBox(double width) {
  return SizedBox(
    width: width,
  );
}

Widget heightBox(double height) {
  return SizedBox(height: height);
}
