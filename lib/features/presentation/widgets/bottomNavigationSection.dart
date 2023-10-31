import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

class BootomNavigationWidget extends StatelessWidget {
  final Function navigationFunction;
  final String lable;
  final String navigationTitle;
  const BootomNavigationWidget(
      {required this.navigationFunction,
      required this.lable,
      required this.navigationTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lable,
          style: DesignColors.fontStyle
              .copyWith(color: DesignColors.secondryColor),
        ),
        widthBox(5),
        InkWell(
          onTap: () {
            navigationFunction();
          },
          child: Text(
            navigationTitle,
            style: DesignColors.fontStyle.copyWith(
                color: DesignColors.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
