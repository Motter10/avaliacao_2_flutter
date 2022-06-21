import 'package:avaliacao_2/models/category.dart';
import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier {
  List<Category> categories = [];

  void add(Category category) {
    categories.add(category);
    notifyListeners();
  }

  void remove(Category category) {
    categories.remove(category);
    notifyListeners();
  }

  void update(Category category) {
    notifyListeners();
  }
}
