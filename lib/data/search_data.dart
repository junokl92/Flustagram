import 'dart:math';

import 'package:flutter_insta/data/post_data.dart';
import 'package:flutter_insta/supports/constants.dart';

class SearchData {
  String id;
  String name;
  PostData data;

  SearchData({required this.id, required this.name})
      : data = Constants().generatePostData(Random().nextInt(30));
}
