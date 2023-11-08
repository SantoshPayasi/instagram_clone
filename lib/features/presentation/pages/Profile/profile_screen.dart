import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/profile_edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DesignColors.backgroundColor,
        titleSpacing: 10,
        title: Text(
          "Username",
          style: DesignColors.fontStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: DesignColors.primaryColor,
                    child: Icon(
                      FontAwesomeIcons.person,
                      color: DesignColors.secondryColor,
                      size: 50,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 20),
                          ),
                          Text(
                            "Posts",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 17),
                          )
                        ],
                      ),
                      widthBox(15),
                      Column(
                        // Column(
                        // Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "2",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 20),
                          ),
                          Text(
                            "Followers",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 17),
                          )
                        ],
                      ),
                      widthBox(15),
                      Column(
                        // Column(
                        // Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "10",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 20),
                          ),
                          Text(
                            "Following",
                            style:
                                DesignColors.fontStyle.copyWith(fontSize: 17),
                          )
                        ],
                      ),
                    ],
                  )
                ]),
          ),
          heightBox(10),
          Text(
            "Username",
            style: DesignColors.fontStyle
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "Description",
            style: DesignColors.fontStyle.copyWith(
                fontWeight: FontWeight.w100, color: DesignColors.secondryColor),
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration:
                      const BoxDecoration(color: DesignColors.secondryColor),
                );
              },
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 32,
              shrinkWrap: true,
            ),
          ),
        ]),
      ),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
              height: 150,
              color: DesignColors.darkGreyColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "More options",
                            style: DesignColors.fontStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                    ),
                    const Divider(
                      color: DesignColors.secondryColor,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen()));
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Edit profile",
                            style: DesignColors.fontStyle.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                          )),
                    ),
                    const Divider(
                      color: DesignColors.secondryColor,
                    ),
                    InkWell(
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Logout",
                            style: DesignColors.fontStyle.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                          )),
                    ),
                  ]),
            ));
  }
}
