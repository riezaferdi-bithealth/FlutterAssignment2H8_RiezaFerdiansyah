import '../models/news_models.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  // Stream and Sink Process di sini !!!
  ListNews? selectedNews;

  void selectNews(ListNews data) {
    selectedNews = data;
    notifyListeners();
  }
}