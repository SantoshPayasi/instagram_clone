// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/widget/profile_edit_form_widget.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController description =
        TextEditingController(text: "Santosh kumar payasi");

    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      appBar: AppBar(backgroundColor: DesignColors.backgroundColor, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
              child: const Icon(
            Icons.check,
            color: DesignColors.blueColor,
            size: 30,
          )),
        )
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //           onTap: () {
              //             Navigator.pop(context);
              //           },
              //           child: const Icon(
              //             Icons.clear_outlined,
              //             size: 30,
              //           )),

              //     ],
              //   ),
              // ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: DesignColors.primaryColor,
                        radius: 45,
                        child: Icon(
                          Icons.person_2,
                          color: DesignColors.secondryColor,
                          size: 50,
                        ),
                      ),
                      heightBox(20),
                      Text(
                        "Please Upload Image",
                        style: DesignColors.fontStyle
                            .copyWith(color: DesignColors.blueColor),
                      ),
                    ],
                  )),
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        const BoxDecoration(color: DesignColors.secondryColor),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: DesignColors.primaryColor,
                      child: Icon(Icons.edit, color: DesignColors.blueColor),
                    ),
                  )
                ],
              ),
              heightBox(20),
              EditProfileForm(controller: description, lable: "Description"),
            ],
          ),
        ),
      ),
    );
  }
}
