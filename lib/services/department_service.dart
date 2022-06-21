import 'package:avaliacao_2/models/department.dart';
import 'package:flutter/material.dart';

class DepartmentService extends ChangeNotifier {
  final List<Department> _departments = [];
  List<Department> get departments => _departments;

  void add(Department department) {
    departments.add(department);
    notifyListeners();
  }

  void remove(Department department) {
    departments.remove(department);
    notifyListeners();
  }

  void update(Department department) {
    notifyListeners();
  }
}
