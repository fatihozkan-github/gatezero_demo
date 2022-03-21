import 'package:flutter/material.dart';

class InteractionProvider extends ChangeNotifier {
  List<String> recycleList = [];

  getRewards() => recycleList.length * 20;

  clearList() {
    recycleList.clear();
    recycleList = [];
    notifyListeners();
  }

  addMaterial(String code) {
    recycleList.add(code);
    notifyListeners();
  }
}
