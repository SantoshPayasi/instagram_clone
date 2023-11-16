import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constInfo.dart';

import '../../../widgets/formInputfield.dart';

class CommentTileWidget extends StatefulWidget {
  const CommentTileWidget({super.key});

  @override
  State<CommentTileWidget> createState() => _CommentTileWidgetState();
}

class _CommentTileWidgetState extends State<CommentTileWidget> {
  bool _isReplying = false;
  TextEditingController reply = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: DesignColors.primaryColor,
            child: Icon(
              Icons.person,
              color: DesignColors.secondryColor,
            ),
          ),
          title: Text("User Name"),
          subtitle: Text("Comment written"),
          trailing:
              Icon(CupertinoIcons.heart, color: DesignColors.secondryColor),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Row(
            children: [
              Text(
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                style: DesignColors.fontStyle.copyWith(
                  color: DesignColors.secondryColor.shade600,
                ),
              ),
              widthBox(15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isReplying = !_isReplying;
                  });
                },
                child: Text(
                  "Reply",
                  style: DesignColors.fontStyle
                      .copyWith(color: DesignColors.secondryColor.shade600),
                ),
              ),
              widthBox(15),
              Text(
                "View Replies",
                style: DesignColors.fontStyle
                    .copyWith(color: DesignColors.secondryColor.shade600),
              )
            ],
          ),
        ),
        _isReplying ? heightBox(10) : heightBox(0),
        _isReplying
            ? Padding(
                padding: const EdgeInsets.only(left: 70, right: 20),
                child: Column(
                  children: [
                    FormInputFields(
                      fieldController: reply,
                      lable: "",
                      hintText: "Post your reply....",
                    ),
                    heightBox(10),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Post",
                        style: DesignColors.fontStyle
                            .copyWith(color: DesignColors.blueColor),
                      ),
                    )
                  ],
                ),
              )
            : heightBox(2)
      ],
    );
  }
}
