import 'package:uuid/uuid.dart';

class Category {
  String code = const Uuid().v4();
  String name = '';
}
