import 'dart:ffi';

import 'package:avaliacao_2/models/category.dart';
import 'package:avaliacao_2/models/department.dart';
import 'package:uuid/uuid.dart';

class Patrimony {
  String code = const Uuid().v4();
  String name = '';
  String description = '';
  double price = 0.0;
  Department department = Department(name: '');
  List<Category> categories = [];

  Patrimony(
      {required this.name,
      required this.description,
      required this.price,
      required this.department,
      required this.categories});
}
