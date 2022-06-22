import 'package:avaliacao_2/models/patrimony.dart';
import 'package:flutter/material.dart';

class PatrimonyService extends ChangeNotifier {
  final List<Patrimony> _patrimonies = [];
  List<Patrimony> get patrimonies => _patrimonies;

  void addPatrimony(Patrimony patrimony) {
    _patrimonies.add(patrimony);
    notifyListeners();
  }

  void removePatrimonyAt(int index) {
    _patrimonies.removeAt(index);
    notifyListeners();
  }

  void updatePatrimony(Patrimony patrimony) {
    patrimonies[_patrimonies.indexOf(patrimony)] = patrimony;
    notifyListeners();
  }
}
