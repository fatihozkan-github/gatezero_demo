import 'package:flutter/material.dart';

import '../core/services/service_firebase.dart';

class InteractionProvider extends ChangeNotifier {
  List<String> recycleList = [];

  Future<int> getRewards({bool barcodeRead = true}) async {
    int _multiplier = 0;
    if (barcodeRead) {
      _multiplier = await FirebaseService.getBarcodeData('8690637879579');
      return recycleList.length * _multiplier;
    } else {
      _multiplier = await FirebaseService.analyseImage('Jm9hXVVtcER1KxALdi99');
      return _multiplier;
    }
  }

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
