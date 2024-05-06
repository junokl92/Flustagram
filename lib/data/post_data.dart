// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:random_name_generator/random_name_generator.dart';

class PostData {
  String id;
  UserData user;
  String caption;
  String? location;
  String photo;
  bool bookMarked;
  bool liked;
  int likeCount;
  int commentCount;
  bool commentshareAble;

  String date;
  double ratio; // w:h = 1: x

  PostData(
      {required this.id,
      required this.user,
      required this.caption,
      required this.location,
      required this.photo,
      required this.bookMarked,
      required this.liked,
      required this.likeCount,
      required this.commentCount,
      required this.date,
      required this.ratio,
      required this.commentshareAble});

  void likedClicked() {
    this.liked = !this.liked;
    this.likeCount += this.liked ? 1 : -1;
  }

  void bookMarkClicked() {
    this.bookMarked = !this.bookMarked;
  }
}
