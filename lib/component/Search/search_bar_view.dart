// ignore_for_file: avoid_print, use_key_in_widget_constructors, unnecessary_this

import 'package:flutter/cupertino.dart';

class SearchBarView extends StatefulWidget {
  Function ontapCallback;
  Function(String) onChangedCallback;
  SearchBarView({required this.ontapCallback, required this.onChangedCallback});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  late TextEditingController _textController;
  bool isActive = false;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onTap: () {
        if (!isActive) {
          this.isActive = true;
          !this.widget.ontapCallback();
        }
      },
      onChanged: (String value) {
        this.widget.onChangedCallback(value);
      },
      onSubmitted: (String value) {
        if (isActive) {
          this.isActive = false;
          this.widget.ontapCallback();
        }
      },
    );
  }
}
