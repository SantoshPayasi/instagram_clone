import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Search/widget/searchFieldWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = SearchController();
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(children: [
                SearchFieldWidget(searchController: searchController),
                heightBox(20),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      color: DesignColors.secondryColor),
                  itemCount: 32,
                  shrinkWrap: true,
                )
              ]),
            )),
      ),
    );
  }
}
