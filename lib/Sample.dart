import 'package:flutter/material.dart';

class Sample with ChangeNotifier {
  String _name;
  Sample(
    this._name,
  );

  getName() {
    return _name;
  }

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  void onChange() {
    notifyListeners();
  }
}
