// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors, unnecessary_import, unnecessary_this, sized_box_for_whitespace, override_on_non_overriding_member, unused_field

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_insta/component/Post/PostCard/post.dart';
import 'package:flutter_insta/component/Post/Story/story_list.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:random_name_generator/random_name_generator.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<PostData> lists = List.generate(
      Random().nextInt(10) + 2, (index) => Constants().generatePostData(index));

  final storyRow = List<UserData>.generate(20, (index) {
    var name = RandomNames(Zone.us);
    var randomIndex = Random().nextInt(50);
    return UserData(
        id: "UR$index",
        name: name.fullName(),
        image: Constants().getRandomImageWithSize(
            size: Size(
                400 + randomIndex.toDouble(), 400 + randomIndex.toDouble())),
        thumbnail: Constants()
            .getRandomImageWithSize(singleSize: 200 + randomIndex.toDouble()),
        newStory: true);
  });

  @override
  void initState() {
    super.initState();
  }

  void rowStoryClicked(UserData user) {
    print("rowStoryClicked clicked ${user.name}");
  }

  void dropDownInNavigator() {
    print("dropDownInNavigator clicked");
  }

  void myNotificationNavigator() {
    print("myNotificationNavigator clicked");
  }

  void inboxNavigator() {
    print("myNotificationNavigator clicked");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: this.dropDownInNavigator,
                          child: Text(
                            "Instagram",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: this.myNotificationNavigator,
                        icon: Icon(CupertinoIcons.heart)),
                    IconButton(
                        onPressed: this.inboxNavigator,
                        icon: Icon(CupertinoIcons.chat_bubble))
                  ],
                ),
              ),
              elevation: 10.0,
              automaticallyImplyLeading: false,
              expandedHeight: 50,
              floating: true,
              snap: true,
            )
          ];
        },
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: lists.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return StoryListView(storyRow,
                          storyClickedCallBack: this.rowStoryClicked);
                    } else {
                      return PostCard(lists[index - 1]);
                    }
                  }))
        ]),
      ),
    ));
  }
}
