// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';

class SearchBarView extends StatefulWidget {
  Function ontapCallback;
  SearchBarView({required this.ontapCallback});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onTap: () {
        this.widget.ontapCallback();
      },
      onChanged: (String value) {
        print('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        print('Submitted text: $value');
        this.widget.ontapCallback();
      },
    );
  }
}
