// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print, unnecessary_this, prefer_const_constructors

import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/data/post_data.dart';

class PostCommentSectionView extends StatefulWidget {
  PostData data;
  PostCommentSectionView(this.data);

  @override
  State<PostCommentSectionView> createState() => _PostCommentSectionViewState();
}

class _PostCommentSectionViewState extends State<PostCommentSectionView> {
  void userClicked(String value) {
    if (value.contains(this.widget.data.user.name)) {
      print("userClicked  ${this.widget.data.user.name}");
    } else {
      print("userClicked  else");
    }
  }

  void openAllComment() {
    print("openAllComment  else");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "${this.widget.data.likeCount} Likes",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: ExpandableRichText(
            "<user>${this.widget.data.user.name}</user> ${this.widget.data.caption}",
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 2,
            toggleTextStyle: TextStyle(color: Colors.grey[500]),
            hashtagStyle: const TextStyle(fontSize: 14, color: Colors.blue),
            customTagStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            onCustomTagTap: this.userClicked,
            onHashtagTap: (value) {
              print("tag clicked $value");
            },
            expandOnTextTap: true,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 12.0, top: 5, bottom: 5),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: this.openAllComment,
            child: Text(
              "Read All ${this.widget.data.commentCount} Comment",
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12),
            child: Text(
              this.widget.data.date,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            )),
      ],
    );
  }
}
