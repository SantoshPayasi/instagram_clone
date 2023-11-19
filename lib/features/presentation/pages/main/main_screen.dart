import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Home/Home_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Profile/profile_screen.dart';
import 'package:instagram_clone/features/presentation/pages/Search/search_screen.dart';

class MainScreen extends StatefulWidget {
  final String uid;
  const MainScreen({required this.uid,super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();
  late int index;
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  void navigatedToNextPage(int value) {
    setState(() {
      index = value;
      pageController.jumpToPage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
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
        children: const [
          HomeScreen(),
          SearchScreen(),
          Center(
            child: Text("Add new Post"),
          ),
          Center(
            child: Text("Liked Post page"),
          ),
          ProfileScreen()
        ],
      ),
    );
  }
}
