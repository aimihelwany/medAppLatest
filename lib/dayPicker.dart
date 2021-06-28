import 'package:flutter/material.dart';
import 'package:medicationinfosys/constants.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentDay = days[0];
  SingleNotifier();

  String get currentDay => _currentDay;

  updateCountry(String value) {
    if (value != _currentDay) {
      _currentDay = value;
      notifyListeners();
    }
  }
}

class MultipleNotifier extends ChangeNotifier {
  List<String> _selectItems;
  MultipleNotifier(this._selectItems);
  List<String> get selectedItems => _selectItems;

  bool isHaveItem(String value) => _selectItems.contains(value);

  addItem(String value) {
    if (!isHaveItem(value)) {
      _selectItems.add(value);
      notifyListeners();
    }
  }

  removeItem(String value) {
    if (isHaveItem(value)) {
      _selectItems.remove(value);
      notifyListeners();
    }
  }
}
