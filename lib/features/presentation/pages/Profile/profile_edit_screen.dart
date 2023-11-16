import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/widget/profile_edit_form_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name =
        TextEditingController(text: "Santosh kumar payasi");
    final TextEditingController userName =
        TextEditingController(text: "Username");
    final TextEditingController bio =
        TextEditingController(text: "This is my simple bio");
    final TextEditingController website =
        TextEditingController(text: "www.sp.co.in");
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.clear_outlined,
                        size: 30,
                      )),
                  const InkWell(
                      child: Icon(
                    Icons.check,
                    color: DesignColors.blueColor,
                    size: 30,
                  ))
                ],
              ),
            ),
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
            Expanded(
                child: Column(
              children: [
                EditProfileForm(controller: name, lable: "Name"),
                heightBox(20),
                EditProfileForm(controller: userName, lable: "Username"),
                heightBox(20),
                EditProfileForm(controller: bio, lable: "Bio"),
                heightBox(20),
                EditProfileForm(controller: website, lable: "Website"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
