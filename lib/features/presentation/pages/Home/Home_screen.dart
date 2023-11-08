// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import "package:flutter_svg/flutter_svg.dart";
import "dart:math";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DesignColors.backgroundColor,
        appBar: AppBar(
            backgroundColor: DesignColors.backgroundColor,
            titleSpacing: 0,
            title: SvgPicture.asset(
              "assets/logo.svg",
              color: DesignColors.primaryColor,
              width: 150.00,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.facebookMessenger))
            ]),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: DesignColors.primaryColor,
                        radius: 20,
                        child: Icon(
                          Icons.person_2_sharp,
                          color: DesignColors.secondryColor,
                        ),
                      ),
                      widthBox(10),
                      Text("Username", style: DesignColors.fontStyle),
                    ],
                  ),
                  const Icon(CupertinoIcons.ellipsis_vertical)
                ],
              ),
            ),
            heightBox(10),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration:
                  const BoxDecoration(color: DesignColors.secondryColor),
            ),
            heightBox(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.heart_fill,
                      size: 25,
                    ),
                    widthBox(12),
                    const Icon(
                      CupertinoIcons.chat_bubble,
                      size: 25,
                    ),
                    widthBox(12),
                    Transform.rotate(
                      angle: -((180 * pi) / 720),
                      child: const Icon(
                        Icons.send_outlined,
                        size: 25,
                        color: DesignColors.primaryColor,
                      ),
                    )
                  ],
                ),
                const Icon(
                  Icons.bookmark_border,
                  size: 30,
                )
              ],
            ),
            heightBox(3),
            Row(
              children: [
                Text(
                  "Username",
                  style: DesignColors.fontStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1),
                ),
                widthBox(5),
                Text(
                  "Some desciption",
                  style: DesignColors.fontStyle,
                )
              ],
            ),
            heightBox(3),
            Text(
              "View all 10 comments",
              style: DesignColors.fontStyle.copyWith(
                color: DesignColors.secondryColor,
              ),
            ),
            Text(
              "10/12/2023",
              style: DesignColors.fontStyle.copyWith(
                color: DesignColors.secondryColor,
              ),
            ),
          ],
        )));
  }
}
