// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, unnecessary_import, unnecessary_this, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/data/user_data.dart';
import 'package:gradient_borders/gradient_borders.dart';

class UserProfileView extends StatefulWidget {
  UserData data;
  double width;
  bool storyAvailable;
  Function(UserData) callback;

  UserProfileView(this.data, this.width,
      {required this.storyAvailable, required this.callback});
  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  void profileClicked() {
    this.widget.callback(this.widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.profileClicked,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: this.widget.storyAvailable
            ? BoxDecoration(
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.yellow],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  width: this.widget.width <= 45 ? 1.5 : 2.5,
                ),
                borderRadius: BorderRadius.circular((this.widget.width) / 2))
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular((this.widget.width - 4) / 2),
          child: Container(
            width: this.widget.width - 4,
            height: this.widget.width - 4,
            color: Colors.grey[300],
            child: Image.network(
              this.widget.data.thumbnail,
              width: this.widget.width - 4,
              height: this.widget.width - 4,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.person);
              },
            ),
          ),
        ),
      ),
    );
  }
}
