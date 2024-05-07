// ignore_for_file: prefer_const_constructors, unnecessary_this, prefer_final_fields

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/component/Search/search_bar_view.dart';
import 'package:flutter_insta/component/Search/search_grid_tile.dart';
import 'package:flutter_insta/supports/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lorem_gen/lorem_gen.dart';

class SearchPage extends StatefulWidget {
  SearchPage();
  List<String> _keywordsList = List.generate(
      30, (index) => Lorem.word(numWords: Random().nextInt(2) + 1));

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isSearchActive = true;
  String filterText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("List ${this.widget._keywordsList.length}");
  }

  void ontapCallback() {
    setState(() {
      this._isSearchActive = !this._isSearchActive;
    });
  }

  void filterCallback(String txt) {
    setState(() {
      filterText = txt;
    });
  }

  List<String> getList() {
    return this
        .widget
        ._keywordsList
        .where((element) =>
            element.toLowerCase().contains(filterText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBarView(
                  ontapCallback: this.ontapCallback,
                  onChangedCallback: this.filterCallback)),
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
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: getList().length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(getList()[index]),
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}
