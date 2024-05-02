// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, unnecessary_this, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_insta/component/User/user_profile_view.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/data/user_data.dart';

class PostInfoSectionView extends StatefulWidget {
  PostData data;
  Function(UserData) userClicked;
  Function(PostData) moreClicked;
  PostInfoSectionView(this.data,
      {required this.userClicked, required this.moreClicked});

  @override
  State<PostInfoSectionView> createState() => _PostInfoSectionViewState();
}

class _PostInfoSectionViewState extends State<PostInfoSectionView> {
  void profileClicked(UserData user) {
    print("Profile clidked ${user.name}");
    this.widget.userClicked(user);
  }

  void postMoreClicked() {
    print("postMoreClicked ");
    this.widget.moreClicked(this.widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Row(
        children: [
          UserProfileView(this.widget.data.user, 40.0,
              storyAvailable: true, callback: this.profileClicked),
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        this.profileClicked(this.widget.data.user);
                      },
                      child: Text(this.widget.data.user.name,
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    Visibility(
                        visible: this.widget.data.location != null,
                        child: Text(this.widget.data.location ?? "")),
                  ],
                )),
          ),
          IconButton(
              onPressed: this.postMoreClicked, icon: Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}
