import 'package:cloud_firestore/cloud_firestore.dart';

import '../UI/shared/utils.dart';

class FirebaseService {
  static CollectionReference _barcodeRef = FirebaseFirestore.instance.collection('barcodes');
  static CollectionReference _imageRef = FirebaseFirestore.instance.collection('images');

  static Future<int> getBarcodeData(String barcode) async {
    try {
      DocumentSnapshot _snapshot = await _barcodeRef.doc(barcode).get();
      if (_snapshot.exists) {
        Map _data = _snapshot.data();
        return _data["multiplier"];
      } else {
        UIUtils.showToast('Error');
        return 0;
      }
    } catch (e) {
      print(e);
      UIUtils.showToast('Error');
      return 0;
    }
  }

  static Future<int> analyseImage(String dataEntry) async {
    try {
      DocumentSnapshot _snapshot = await _imageRef.doc(dataEntry).get();
      if (_snapshot.exists) {
        Map _data = _snapshot.data();
        return _data["multiplier"];
      } else {
        UIUtils.showToast('Error');
        return 0;
      }
    } catch (e) {
      print(e);
      UIUtils.showToast('Error');
      return 0;
    }
  }
}
