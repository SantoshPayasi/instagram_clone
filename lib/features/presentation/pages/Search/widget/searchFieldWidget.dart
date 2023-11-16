// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

class SearchFieldWidget extends StatefulWidget {
  final SearchController searchController;
  const SearchFieldWidget({required this.searchController, super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor:
          const MaterialStatePropertyAll<Color>(DesignColors.backgroundColor),
      controller: widget.searchController,
      hintText: "Search posts",
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 10)),
      hintStyle: MaterialStatePropertyAll<TextStyle>(
          DesignColors.fontStyle.copyWith(fontSize: 15)),
      shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
      textStyle: MaterialStateProperty.resolveWith((states) {
        return DesignColors.fontStyle.copyWith(
            fontSize: 15,
            letterSpacing: 1,
            wordSpacing: 1,
            color: DesignColors.primaryColor);
      }),
      leading: const Icon(
        Icons.search,
        color: DesignColors.secondryColor,
      ),
      side: MaterialStatePropertyAll<BorderSide>(
        BorderSide(
            color: DesignColors.secondryColor.withOpacity(0.5),
            strokeAlign: BorderSide.strokeAlignCenter),
      ),
    );
  }
}
