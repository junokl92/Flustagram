// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_insta/supports/constants.dart';

class SearchGridTile extends StatelessWidget {
  int index;
  late Size size;

  SearchGridTile({required this.index, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Image.network(
        Constants().getRandomImageWithSize(size: size),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.image);
        },
      ),
    );
  }
}
