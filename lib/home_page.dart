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
  final List<PostData> lists = [
    PostData(
        id: "PT1001",
        user: UserData(
            id: "US001",
            name: "Alex.wahaha",
            thumbnail: Constants().getRandomImageWithSize(size: Size(200, 210)),
            image: Constants().getRandomImageWithSize(size: Size(400, 400)),
            newStory: true),
        caption:
            "Encapsulation is the concept of bundling data (attributes) and methods (behavior) together within a class, hiding the internal implementation details from the outside world. It promotes data security and reduces code complexity. In Dart, you can use access modifiers like public, private, and protected to control the visibility of class \n\n#members. #Hahaha #waThisisthe",
        location: "Sg",
        photo: Constants().getRandomImageWithSize(size: Size(720, 920)),
        bookMarked: false,
        liked: false,
        likeCount: 12,
        commentCount: 10,
        date: "12 min ago",
        ratio: 720.0 / 920.0,
        commentshareAble: true),
    PostData(
        id: "PT1002",
        user: UserData(
            id: "US002",
            name: "Brandon.liong",
            thumbnail: Constants().getRandomImageWithSize(size: Size(300, 210)),
            image: Constants().getRandomImageWithSize(size: Size(400, 400)),
            newStory: false),
        caption:
            "Icon sizes \nWhen creating an icon button with an Icon, do not override the icon's size with its Icon.size parameter, use the icon button's iconSize parameter instead. For example do this: \n#Wall \n#RunAwayFromHome \n#SpiderWeb",
        location: null,
        photo: Constants().getRandomImageWithSize(size: Size(720, 560)),
        bookMarked: false,
        liked: false,
        likeCount: 20,
        commentCount: 3,
        date: "1 day ago",
        ratio: 720.0 / 560,
        commentshareAble: true),
    PostData(
        id: "PT1003",
        user: UserData(
            id: "US003",
            name: "Chaster_Ang",
            thumbnail: Constants().getRandomImageWithSize(size: Size(120, 150)),
            image: Constants().getRandomImageWithSize(size: Size(400, 400)),
            newStory: true),
        caption:
            "搞笑對抗賽 ft.達康.come 黃豪平 ►\n【面白】巔峰對決！裝傻VS吐槽－搞笑對抗賽   \n\n • 【面白】巔峰對決！裝傻VS吐槽－搞...  \n【面白】第二屆搞笑對抗賽-天龍VS地虎ft.達康.come.菜冠雙頭https://reurl.cc/4XkGmK​​​​​​​​​​​​ \n#DKcom \n#Comedy",
        location: "Columbia",
        photo: Constants().getRandomImageWithSize(size: Size(1080, 920)),
        bookMarked: false,
        liked: false,
        likeCount: 120,
        commentCount: 8,
        date: "1 week ago",
        ratio: 1080.0 / 920,
        commentshareAble: false),
    PostData(
        id: "PT1004",
        user: UserData(
            id: "US003",
            name: "Dylan_Yong_TaoFu",
            thumbnail: Constants().getRandomImageWithSize(singleSize: 200),
            image: Constants().getRandomImageWithSize(size: Size(400, 400)),
            newStory: true),
        caption: "First day to run away..",
        location: "Sleep at home please.",
        photo: Constants().getRandomImageWithSize(size: Size(720, 1080)),
        bookMarked: false,
        liked: false,
        likeCount: 19,
        commentCount: 38,
        date: "3 months ago",
        ratio: .0 / 1080.0,
        commentshareAble: false)
  ];

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
        body: Column(
          children: <Widget>[
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
          ],
        ),
      ),
    ));
  }
}
