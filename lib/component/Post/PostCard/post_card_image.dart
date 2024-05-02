// ignore_for_file: unused_element, must_be_immutable, use_key_in_widget_constructors, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_insta/data/post_data.dart';

class PostCardImageSection extends StatefulWidget {
  PostData data;
  Function likeButtonActionCallback;
  PostCardImageSection(this.data, this.likeButtonActionCallback);

  @override
  State<PostCardImageSection> createState() => _PostCardImageSectionState();
}

class _PostCardImageSectionState extends State<PostCardImageSection> {
  void likeImageAction() {
    this.widget.likeButtonActionCallback();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: this.likeImageAction,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.grey[200],
            child: Image.network(
              width: constraints.maxWidth,
              height: constraints.maxWidth * this.widget.data.ratio,
              this.widget.data.photo,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image);
              },
            ),
          );
        },
      ),
    );
  }
}
