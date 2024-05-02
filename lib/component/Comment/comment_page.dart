// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, must_be_immutable, unused_field, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, override_on_non_overriding_member

import 'dart:math';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/component/Comment/comment_empty.dart';
import 'package:flutter_insta/component/Comment/comment_section_view.dart';
import 'package:flutter_insta/data/comment_data.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:random_name_generator/random_name_generator.dart';

class CommentView extends StatefulWidget {
  PostData data;
  CommentView(this.data);

  // data
  final _commentList = List<CommentData>.generate(10, (index) {
    var name = RandomNames(Zone.us);
    var randomIndex = Random().nextInt(50);
    var randomCommentCount = Random().nextInt(999);
    var likeCount = Random().nextInt(999);
    var commentCount = index % 3 == 0 ? Random().nextInt(10) : 0;

    var user = UserData(
        id: "UR$index",
        name: name.fullName(),
        image: Constants().getRandomImageWithSize(
            size: Size(
                400 + randomIndex.toDouble(), 400 + randomIndex.toDouble())),
        thumbnail: Constants()
            .getRandomImageWithSize(singleSize: 200 + randomIndex.toDouble()),
        newStory: true);

    return CommentData(
        id: index.toString(),
        user: user,
        comment: Lorem.word(numWords: Random().nextInt(6) + 2),
        timeStamp: "$index min ago",
        replyCount: randomCommentCount,
        likeCount: likeCount,
        commentCount: commentCount,
        isLiked: false);
  });

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  void shareClicked() {}

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.of(context).pop();
      },
      direction: DismissiblePageDismissDirection.down,
      startingOpacity: 0.6,
      minScale: 1,
      isFullScreen: false,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Visibility(
                        visible: this.widget.data.commentshareAble,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            CupertinoIcons.paperplane,
                          ),
                          onPressed: this.shareClicked,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text("Comment", textAlign: TextAlign.center)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: this.widget._commentList.isNotEmpty
                      ? this.widget._commentList.length
                      : 1,
                  itemBuilder: (context, index) {
                    if (this.widget._commentList.isEmpty) {
                      return EmptyCommentView();
                    } else {
                      return CommentSectionView(
                        this.widget._commentList[index],
                        isSubComment: false,
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
