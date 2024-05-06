// ignore_for_file: unused_local_variable, avoid_print, constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:random_name_generator/random_name_generator.dart';

class Constants {
  static const String thumbnail = "https://picsum.photos/(308)";

  String getRandomImageWithSize({double? singleSize, Size? size}) {
    int? height = singleSize?.round() ?? size?.height.round();
    int? width = singleSize?.round() ?? size?.width.round();

    return "https://picsum.photos/$height/$width";
  }

  PostData generatePostData(int? index) {
    double width = Random().nextInt(300) + 500;
    double height = Random().nextInt(300) + 500;
    var name = RandomNames(Zone.us);

    return PostData(
        id: index != null
            ? "PT${1000 + index}"
            : "PT${Random().nextInt(100) + 1000}",
        user: UserData(
            id: "US003",
            name: name.fullName(),
            thumbnail: Constants().getRandomImageWithSize(size: Size(120, 150)),
            image: Constants().getRandomImageWithSize(size: Size(400, 400)),
            newStory: true),
        caption: Lorem.word(numWords: Random().nextInt(20) + 2),
        location: "${Lorem.word(numWords: Random().nextInt(3))} Inc.",
        photo: Constants().getRandomImageWithSize(size: Size(width, height)),
        bookMarked: false,
        liked: false,
        likeCount: Random().nextInt(300),
        commentCount: Random().nextInt(30),
        date: "${index != null ? index + 1 : Random().nextInt(10)} weeks ago",
        ratio: width / height,
        commentshareAble: false);
  }
}

enum PostAction { Comment, Share, BookMark }

enum CommentAction { Like, Reply, LoadMore }
