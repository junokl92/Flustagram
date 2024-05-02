// ignore_for_file: unnecessary_this

import 'package:flutter_insta/data/user_data.dart';

class CommentData {
  String id;
  UserData user;
  String comment;
  String timeStamp;
  int replyCount;
  int likeCount;
  int commentCount;
  bool isLiked;

  CommentData(
      {required this.id,
      required this.user,
      required this.comment,
      required this.timeStamp,
      required this.replyCount,
      required this.likeCount,
      required this.commentCount,
      required this.isLiked});

  void likedClicked() {
    this.isLiked = !this.isLiked;
    this.likeCount += this.isLiked ? 1 : -1;
  }

  void replyToAddCommentClicked() {
    this.commentCount += 1;
  }
}
