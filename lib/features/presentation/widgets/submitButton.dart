// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

class SubmitButton extends StatelessWidget {
  final Function onTapAction;
  final String lable;
  const SubmitButton(
      {required this.lable, required this.onTapAction, super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapAction(),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: DesignColors.blueColor),
          child: Text(
            lable,
            style: DesignColors.fontStyle
                .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
