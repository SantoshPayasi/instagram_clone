import 'dart:io';

import 'package:flutter/material.dart';
import '../../../constInfo.dart';
import "package:cached_network_image/cached_network_image.dart";

Widget profilePic({File? file, String? imageUrl}) {
  return file == null
      ? (imageUrl != null
          ? const CircleAvatar(
              backgroundColor: DesignColors.primaryColor,
              radius: 30,
              child: Icon(
                Icons.person_rounded,
                color: DesignColors.secondryColor,
                size: 30,
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.contain,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundColor: DesignColors.primaryColor,
                radius: 30,
                child: Image(image: imageProvider),
              ),
              progressIndicatorBuilder: (context, url, progress) =>
                  CircularProgressIndicator(
                value: progress.progress,
              ),
            ))
      : CircleAvatar(
          backgroundColor: DesignColors.primaryColor,
          radius: 30,
          
          child: Image.file(file, fit: BoxFit.cover,));
}
