import 'package:avaliacao_2/models/category.dart';
import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier {
  final List<Category> _categories = [];
  List<Category> get categories => _categories;

  void add(Category category) {
    categories.add(category);
    notifyListeners();
  }

  void remove(Category category) {
    categories.remove(category);
    notifyListeners();
  }

  void update(Category category) {
    categories[categories.indexOf(category)] = category;
    notifyListeners();
  }

  void removeAt(int index) {
    categories.removeAt(index);
    notifyListeners();
  }
}
