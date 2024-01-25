import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import '../models/news_models.dart';

Future<List<ListNews>> getNewsData() async {
  final jsonData = await rootBundle.loadString('assets/json/data_berita.json');
  final list = json.decode(jsonData) as List<dynamic>;
  //print(list);
  return list.map((el) => ListNews.fromJson(el)).toList();
}
