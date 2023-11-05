import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/widgets/searchFieldWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = SearchController();
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            children: [
              SearchFieldWidget(searchController: searchController),
              heightBox(20),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: DesignColors.secondryColor));
                },
                itemCount: 4,
                // shrinkWrap: true,
              )
            ],
          ),
        ),
      )),
    );
  }
}
