// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/component/Search/search_bar_view.dart';
import 'package:flutter_insta/component/Search/search_grid_tile.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isSearchActive = true;

  void ontapCallback() {
    setState(() {
      this._isSearchActive = !this._isSearchActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBarView(ontapCallback: this.ontapCallback)),
        ),
        Visibility(
          visible: _isSearchActive,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: GridView.custom(
                padding: EdgeInsets.zero,
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => SearchGridTile(
                      index: index,
                      size: Size(Random().nextDouble() * 200 + 100,
                          Random().nextDouble() * 200 + 100)),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isSearchActive,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: GridView.custom(
                padding: EdgeInsets.zero,
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => SearchGridTile(
                      index: index,
                      size: Size(Random().nextDouble() * 200 + 100,
                          Random().nextDouble() * 200 + 100)),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
