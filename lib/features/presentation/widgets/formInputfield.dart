
// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

class FormInputFields extends StatefulWidget {
  final TextEditingController fieldController;
  final String lable;
  bool isPassword;
  final hintText;
  FormInputFields(
      {required this.fieldController,
      required this.lable,
      this.isPassword = false,
      this.hintText,
      super.key});

  @override
  State<FormInputFields> createState() => _FormInputFieldsState();
}

class _FormInputFieldsState extends State<FormInputFields> {
  OutlineInputBorder defaultBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: DesignColors.darkGreyColor));

  void showPassword() {
    setState(() {
      widget.isPassword = !widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          color: DesignColors.backgroundColor),
      child: TextFormField(
        textAlign: TextAlign.justify,
        controller: widget.fieldController,
        keyboardType: TextInputType.text,
        obscureText: widget.isPassword,
        style: const TextStyle(letterSpacing: 1, fontSize: 15),
        decoration: InputDecoration(
            border: defaultBorder,
            hintText: widget.hintText,
            fillColor: DesignColors.darkGreyColor,
            filled: true,
            enabledBorder: defaultBorder,
            focusedBorder: defaultBorder,
            suffixIconColor: DesignColors.secondryColor,
            suffixIcon: widget.lable == "Password"
                ? (widget.isPassword
                    ? IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: showPassword,
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: DesignColors.blueColor,
                        ),
                        onPressed: showPassword,
                        tooltip: widget.isPassword
                            ? "Password is hidden"
                            : "Password is shown",
                      ))
                : null),
      ),
    );
  }
}
