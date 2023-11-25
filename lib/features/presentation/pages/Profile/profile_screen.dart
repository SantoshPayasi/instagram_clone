import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/widgets/ProfilePic_widget.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
 UserEntity? user;
   ProfileScreen({super.key,  this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DesignColors.backgroundColor,
        titleSpacing: 10,
        title: Text(
          (user?.username==null || user!.username!.isEmpty)?"New user":"${user?.username}",
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
                  profilePic(imageUrl: user?.profileUrl),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${user?.posts}",
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
                            "${user?.totalFollowers}",
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
                            "${user?.totalFollowing}",
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
            "${user?.name == ""?  user?.username : user?.name}",
            style: DesignColors.fontStyle
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "${user?.bio}",
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
                        Navigator.pushNamed(
                            context, PageRoutes.editProfileScreen, arguments: user);
                        // Navigator.pushNamed(context, "xyz");
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
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<AuthCubit>(context).loggedOut();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  PageRoutes.signInScreen, (route) => false);
                            },
                            child: Text(
                              "Logout",
                              style: DesignColors.fontStyle.copyWith(
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          )),
                    ),
                  ]),
            ));
  }
}
