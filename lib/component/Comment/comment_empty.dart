// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class EmptyCommentView extends StatefulWidget {
  const EmptyCommentView({super.key});

  @override
  State<EmptyCommentView> createState() => _EmptyCommentViewState();
}

class _EmptyCommentViewState extends State<EmptyCommentView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 200,
          child: Column(
            children: <Widget>[
              Text(
                "尚無留言",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "尚無留言",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          )),
    );
  }
}
