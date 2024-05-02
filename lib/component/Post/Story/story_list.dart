// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, must_be_immutable, prefer_const_constructors, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter_insta/component/User/user_profile_view.dart';
import 'package:flutter_insta/data/user_data.dart';

class StoryListView extends StatelessWidget {
  final List<UserData> storyRow;
  Function(UserData) storyClickedCallBack;

  StoryListView(this.storyRow, {required this.storyClickedCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: storyRow.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              UserData user = storyRow[index];
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: UserProfileView(user, 90,
                            storyAvailable: true,
                            callback: this.storyClickedCallBack)),
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
