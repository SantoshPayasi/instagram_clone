import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

class EditProfileForm extends StatefulWidget {
  final TextEditingController controller;
  final String lable;
  const EditProfileForm(
      {required this.controller, required this.lable, super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  UnderlineInputBorder fieldBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: DesignColors.primaryColor));
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      
      decoration: InputDecoration(
          fillColor: DesignColors.backgroundColor,
          filled: true,
          label: Text(widget.lable),
          labelStyle: DesignColors.fontStyle
              .copyWith(color: DesignColors.secondryColor, fontSize: 15),
          border: fieldBorder,
          enabledBorder: fieldBorder,
          focusedBorder: fieldBorder),
    );
  }
}
