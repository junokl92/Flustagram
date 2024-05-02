// ignore_for_file: unnecessary_this, use_key_in_widget_constructors, must_be_immutable, sort_child_properties_last, prefer_const_constructors, avoid_print

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/component/Comment/comment_page.dart';
import 'package:flutter_insta/component/Post/PostCard/post_action_section_view.dart';
import 'package:flutter_insta/component/Post/PostCard/post_card_image.dart';
import 'package:flutter_insta/component/Post/PostCard/post_command_section_view.dart';
import 'package:flutter_insta/component/Post/PostCard/post_info_section_view.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:flutter_insta/supports/constants.dart';

class PostCard extends StatefulWidget {
  PostData data;

  PostCard(this.data);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void imageDoubleTap() {
    print("imageDoubleTap");
    setState(() {
      this.widget.data.likedClicked();
    });
  }

  void postAction(PostAction action) {
    switch (action) {
      case PostAction.Comment:
        print("Comment");
        context.pushTransparentRoute(CommentView(this.widget.data));
        break;
      case PostAction.Share:
        print("Share");
        break;
      case PostAction.BookMark:
        print("BookMark");
        setState(() {
          this.widget.data.bookMarkClicked();
        });
        break;
      default:
    }
  }

  void userClicked(UserData user) {}
  void moreClicked(PostData data) {}
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            PostInfoSectionView(
              this.widget.data,
              userClicked: this.userClicked,
              moreClicked: this.moreClicked,
            ),
            PostCardImageSection(this.widget.data, this.imageDoubleTap),
            PostActionSectionView(
                this.widget.data, this.imageDoubleTap, this.postAction),
            PostCommentSectionView(this.widget.data),
          ],
        ),
        color: Colors.white);
  }
}
