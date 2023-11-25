// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../constInfo.dart';
import "package:cached_network_image/cached_network_image.dart";

Widget profilePic({File? file, String? imageUrl}) {
  if (kDebugMode) {
    print("THis is the profile url $imageUrl");
  }
  return file == null
      ? (imageUrl == null
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
              imageBuilder: (context, imageProvider) => Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: DesignColors.backgroundColor),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
              progressIndicatorBuilder: (context, url, progress) =>
                  CircularProgressIndicator(
                value: progress.progress,
              ),
            ))
      : ProfileWidget(file);
}

// ignore: non_constant_identifier_names
Container ProfileWidget(File file) {
  return Container(
    height: 70,
    width: 70,
    decoration: const BoxDecoration(
        shape: BoxShape.circle, color: DesignColors.primaryColor),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.file(
          file,
          fit: BoxFit.cover,
        )),
  );
}
