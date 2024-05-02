// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unnecessary_this, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_insta/supports/constants.dart';

class PostActionSectionView extends StatefulWidget {
  PostData data;
  Function likeButtonActionCallback;
  Function(PostAction action) postActionCallback;

  PostActionSectionView(
      this.data, this.likeButtonActionCallback, this.postActionCallback);
  @override
  State<PostActionSectionView> createState() => _PostActionSectionViewState();
}

class _PostActionSectionViewState extends State<PostActionSectionView> {
  void likeButtonAction() {
    this.widget.likeButtonActionCallback();
  }

  void commentButtonAction() {
    this.widget.postActionCallback(PostAction.Comment);
  }

  void shareButtonAction() {
    this.widget.postActionCallback(PostAction.Share);
  }

  void bookmarkButtonAction() {
    this.widget.postActionCallback(PostAction.BookMark);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.zero,
          child: IconButton(
              onPressed: this.likeButtonAction,
              icon: this.widget.data.liked
                  ? Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.pink,
                    )
                  : Icon(CupertinoIcons.heart)),
        ),
        IconButton(
            onPressed: this.commentButtonAction,
            icon: Icon(CupertinoIcons.chat_bubble)),
        IconButton(
            onPressed: this.shareButtonAction,
            icon: Icon(CupertinoIcons.paperplane)),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: this.bookmarkButtonAction,
                icon: this.widget.data.bookMarked
                    ? Icon(CupertinoIcons.bookmark_fill)
                    : Icon(CupertinoIcons.bookmark)),
          ),
        ),
      ],
    );
  }
}
