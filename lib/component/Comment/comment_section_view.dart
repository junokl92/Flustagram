// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_this, unnecessary_string_interpolations, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:math';

import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/component/User/user_profile_view.dart';
import 'package:flutter_insta/data/comment_data.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:random_name_generator/random_name_generator.dart';

class CommentSectionView extends StatefulWidget {
  final CommentData data;
  final bool isSubComment;
  CommentSectionView(this.data, {required this.isSubComment});

  @override
  State<CommentSectionView> createState() => _CommentSectionViewState();
}

class _CommentSectionViewState extends State<CommentSectionView> {
  bool isExpended = false;
  void actionClicked(CommentAction action) {
    switch (action) {
      case CommentAction.Like:
        setState(() {
          this.widget.data.likedClicked();
        });
        break;
      case CommentAction.Reply:
        setState(() {
          this.widget.data.replyToAddCommentClicked();
        });
        print("Reply action");
        break;
      case CommentAction.LoadMore:
        print("Load More action");
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserProfileView(
              this.widget.data.user, this.widget.isSubComment ? 30 : 40,
              storyAvailable: false, callback: (p0) => null),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            CommentSectionInfoView(this.widget.data),
                            CommentSectionMainView(this.widget.data,
                                htagCallback: (String htag) {}),
                            CommentActionView(
                              actionClicked: this.actionClicked,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                this.actionClicked(CommentAction.Like);
                              },
                              icon: Icon(
                                this.widget.data.isLiked
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: this.widget.data.isLiked
                                    ? Colors.red
                                    : Colors.black,
                              )),
                          Text("${this.widget.data.likeCount}")
                        ],
                      )
                    ],
                  ),
                  CommentExpandedCommentView(
                      this.widget.data, this.isExpended, this.actionClicked),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CommentSectionInfoView extends StatelessWidget {
  final CommentData data;
  CommentSectionInfoView(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            this.data.user.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              this.data.timeStamp,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class CommentSectionMainView extends StatelessWidget {
  final CommentData data;
  Function(String) htagCallback;
  CommentSectionMainView(this.data, {required this.htagCallback});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ExpandableRichText(
        "${this.data.comment}",
        expanded: true,
        maxLines: 2,
        toggleTextStyle: TextStyle(color: Colors.grey[500]),
        hashtagStyle: const TextStyle(fontSize: 14, color: Colors.blue),
        customTagStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
        onHashtagTap: (value) {
          print("tag clicked $value");
          this.htagCallback(value);
        },
        expandOnTextTap: true,
      ),
    );
  }
}

class CommentExpandedCommentView extends StatefulWidget {
  final CommentData data;
  Function(CommentAction) loadMoreCallback;

  bool isExpended;
  CommentExpandedCommentView(this.data, this.isExpended, this.loadMoreCallback);

  @override
  State<CommentExpandedCommentView> createState() =>
      _CommentExpandedCommentViewState();
}

class _CommentExpandedCommentViewState
    extends State<CommentExpandedCommentView> {
  bool isExpand = false;

// data
  late var subCommentList = [];
  @override
  void initState() {
    super.initState();
    this.loadData();
  }

  void loadData() {
    this.subCommentList =
        List<CommentData>.generate(this.widget.data.commentCount, (index) {
      var name = RandomNames(Zone.us);
      var randomIndex = Random().nextInt(50);
      var randomCommentCount = Random().nextInt(999);
      var likeCount = Random().nextInt(999);

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
          commentCount: 0,
          isLiked: false);
    });
  }

  void _expandOnChanged(CommentAction action) {
    this.widget.loadMoreCallback(action);
    setState(() {
      this.isExpand = !this.isExpand;
      this.loadData();
    });
  }

  void htagCallback(String value) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
            children: List.generate(isExpand ? this.subCommentList.length : 0,
                (index) {
          CommentData data = this.subCommentList[index];
          return Container(
              alignment: Alignment.topLeft,
              child: CommentSectionView(
                data,
                isSubComment: true,
              ));
        })),
        CommentSectionLoadMoreView(this.widget.data,
            loadMoreCallback: this._expandOnChanged),
      ],
    );
  }
}

class CommentSectionLoadMoreView extends StatelessWidget {
  final CommentData data;
  Function(CommentAction) loadMoreCallback;

  CommentSectionLoadMoreView(this.data, {required this.loadMoreCallback});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: this.data.commentCount != 0,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 50,
              child: Divider(
                color: Colors.grey,
                height: 30.0,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {
                  this.loadMoreCallback(CommentAction.LoadMore);
                },
                child: Text(
                  "See ${this.data.commentCount} other responses",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ));
  }
}

class CommentActionView extends StatelessWidget {
  Function(CommentAction) actionClicked;
  CommentActionView({required this.actionClicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            this.actionClicked(CommentAction.Reply);
          },
          child: Text(
            "Reply",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Translate",
          style: TextStyle(color: Colors.grey.shade600),
        )
      ],
    );
  }
}
