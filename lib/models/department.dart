import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Department {
  String code = const Uuid().v4();
  String name = '';

  Department({required this.name});
}
