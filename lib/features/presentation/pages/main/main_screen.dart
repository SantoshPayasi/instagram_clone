import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/cubit/user/getSIngleUser/cubit/get_single_user_cubit.dart';
import 'package:instagram_clone/features/presentation/pages/Home/Home_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/profile_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Search/search_screen.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signIn_page.dart';

class MainScreen extends StatefulWidget {
  final String uid;
  const MainScreen({required this.uid, super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();
  late int index;

  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleuser(widget.uid);
    index = 0;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigatedToNextPage(int value) {
    setState(() {
      index = value;
      pageController.jumpToPage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, getSingleUserstate) {
        if (getSingleUserstate is SingleUserLoaded) {
          final UserEntity user = getSingleUserstate.user;
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: DesignColors.primaryColor,
                selectedItemColor: DesignColors.primaryColor,
                backgroundColor: DesignColors.backgroundColor,
                onTap: navigatedToNextPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      activeIcon: Icon(
                        Icons.home_filled,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined),
                    activeIcon: Icon(Icons.add_box),
                    label: "Add-Post",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart),
                    activeIcon: Icon(CupertinoIcons.heart_fill),
                    label: "Liked-Post",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: "Profile",
                  ),
                ]),
            body: PageView(
              controller: pageController,
              onPageChanged: navigatedToNextPage,
              children: [
                const HomeScreen(),
                const SearchScreen(),
                const Center(
                  child: Text("Add new Post"),
                ),
                const Center(
                  child: Text("Liked Post page"),
                ),
                ProfileScreen(
                  user: user,
                )
              ],
            ),
          );
        } else if (getSingleUserstate is SIngleUserFailure) {
          return const SigninPage();
        } else {
          return const Center(child:  CircularProgressIndicator());
        }
      },
    );
  }
}
