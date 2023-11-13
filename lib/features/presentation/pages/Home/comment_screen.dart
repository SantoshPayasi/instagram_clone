import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';
import 'package:instagram_clone/features/presentation/pages/Home/widgets/comment_tile_widget.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: DesignColors.primaryColor,
                child: Icon(
                  Icons.person,
                  color: DesignColors.secondryColor,
                  size: 30,
                ),
              ),
              heightBox(10),
              Text(
                "Username",
                style: DesignColors.fontStyle.copyWith(fontSize: 15),
              )
            ]),
          ),
          const Divider(
            height: 10,
            color: DesignColors.secondryColor,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CommentTileWidget();
                  },
                  separatorBuilder: (context, index) {
                    return heightBox(10);
                  },
                  itemCount: 32))
        ],
      )),
    );
  }
}
