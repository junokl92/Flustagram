// ignore_for_file: unused_local_variable, avoid_print, constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const String thumbnail = "https://picsum.photos/(308)";

  String getRandomImageWithSize({double? singleSize, Size? size}) {
    int? height = singleSize?.round() ?? size?.height.round();
    int? width = singleSize?.round() ?? size?.width.round();

    return "https://picsum.photos/$height/$width";
  }
}

enum PostAction { Comment, Share, BookMark }

enum CommentAction { Like, Reply, LoadMore }
