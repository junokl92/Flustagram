// ignore_for_file: prefer_const_constructors, unnecessary_this, must_be_immutable, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_insta/component/Post/PostCard/post.dart';
import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/supports/constants.dart';

class ProfilePage extends StatefulWidget {
  final String firstPhoto;
  ProfilePage(this.firstPhoto);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<PostData> _lists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lists = List.generate(5, (index) {
      if (index == 0) {
        var data = Constants().generatePostData(index);
        data.photo = this.widget.firstPhoto;
        return data;
      }

      return Constants().generatePostData(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          child: ListView.builder(
              itemCount: this._lists.length, // lists.length,
              itemBuilder: (context, index) {
                return PostCard(this._lists[index]);
              }))
    ]));
  }
}
