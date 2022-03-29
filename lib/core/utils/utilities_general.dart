import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';

import '../UI/shared/utils.dart';
import '../services/service_localization.dart';
import '../services/service_permission.dart';

class GeneralUtils {
  /// • Converts date to readable text for users.
  ///
  /// • As [timeStamp] one must use Flutter's [DateTime] for correct results.
  ///
  /// • If [timeStamp] is not valid, this function uses DateTime.now() as timeStamp.
  static String getReadableDate({String timeStamp}) {
    String _date = '';
    String _holder = '';
    if (!GeneralUtils.hasData(timeStamp)) {
      _holder = DateTime.now().toString().substring(0, 10);
    } else {
      _holder = timeStamp.substring(0, 10);
    }
    List _holderList = _holder.split('-');
    _date = _holderList[2] + '.' + _holderList[1] + '.' + _holderList[0];
    return _date;
  }

  /// • Checks whether the given mail is valid or not.
  ///
  /// • Supported extensions (for now): gmail, hotmail, ford & borusan.
  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    List<String> _allowedExtensions = ['gmail.com', 'hotmail.com', 'borusan.com', 'ford.com'];
    List _splitList = email.split('@');
    bool _isValid = regex.hasMatch(email) && _allowedExtensions.contains(_splitList.last);
    return _isValid;
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    Pattern pattern = r'^(05(\d{9}))$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(phoneNumber)) ? true : false;
  }

  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      try {
        await launch(url);
      } catch (e) {
        print(e);
        UIUtils.showToast(LocalizationService.texts.genericError);
      }
    } else {
      UIUtils.showToast(LocalizationService.texts.genericError);
    }
  }

  static void copyToClipBoard(String msg) async {
    try {
      await Clipboard.setData(ClipboardData(text: msg));
      UIUtils.showToast(LocalizationService.texts.copiedToClipBoard);
    } catch (e) {
      print(e);
      UIUtils.showToast('Panoya kopyalanırken bir hata oluştu.');
    }
  }

  /// if(variable !=null) ekle
  static bool hasData(var variable) {
    if (variable is String) {
      return ((variable?.isNotEmpty ?? false) || variable.trim() != '') ?? false;
    } else if (variable is int || variable is double) {
      return ((variable.toString()?.isNotEmpty ?? false) || variable.toString().trim() != '') ?? false;
    } else if (variable is bool) {
      if (variable == null) {
        return false;
      } else if (variable == false || variable == true) {
        return true;
      } else
        return false;
    } else
      return false;
  }

  static Future<void> takeSSandShare(ScreenshotController ssController, {String ssName = ''}) async {
    Uint8List bytes = await ssController.capture();
    try {
      final directory = await getApplicationDocumentsDirectory();
      final imageFile = bytes;
      File pathOfImage;
      if (hasData(ssName)) {
        pathOfImage = await File('${directory.path}/${ssName}.png').create();
      } else
        pathOfImage = await File('${directory.path}/${DateTime.now()}.png').create();
      await pathOfImage.writeAsBytes(imageFile.buffer.asUint8List());
      await Share.shareFiles([pathOfImage.path], sharePositionOrigin: Rect.zero);
    } catch (e) {
      print(e);
    }
  }

  /// • Pick an image from gallery or camera.
  static Future<File> pickImage({ImageSource src = ImageSource.gallery}) async {
    await PermissionService.checkPhotosPermission();
    try {
      XFile _pickedFile = await ImagePicker().pickImage(source: src);
      File _imageFile = File(_pickedFile.path);
      if (_pickedFile != null) {
        return _imageFile;
      } else
        UIUtils.showToast('Fotoğraf seçilemedi lütfen uygulama izinlerini kontrol et.');
      return null;
    } catch (e) {
      UIUtils.showToast(LocalizationService.texts.genericError);
      return null;
    }
  }

  // static Future uploadImage({bool targetGallery = true, String directory = 'challengePhotos', String pathArgument = ''}) async {
  //   File _imageFile;
  //
  //   if (targetGallery) {
  //     _imageFile = await _pickImage();
  //   } else
  //     _imageFile = await _pickImage(src: ImageSource.camera);
  //
  //   if (_imageFile != null) {
  //     try {
  //       if (targetGallery) {
  //         var snapshot = await _storageRef.child('profilePhotos/${_currentUserID}/${DateTime.now()}').putFile(_imageFile);
  //         String _photoURL = await snapshot.ref.getDownloadURL();
  //         return _photoURL;
  //       } else if (!targetGallery) {
  //         var snapshot = await _storageRef.child('$directory/${_currentUserID}/$pathArgument').putFile(_imageFile);
  //         String _photoURL = await snapshot.ref.getDownloadURL();
  //         UIUtils.showToast('Fotoğrafın yüklendi!');
  //         return _photoURL;
  //       }
  //     } catch (e) {
  //       print(e);
  //       UIUtils.showToast('Fotoğraf yüklenemedi!');
  //     }
  //   } else {
  //     UIUtils.showToast(LocalizationService.texts.genericError);
  //   }
  // }

  /// • Updates the profile image of the current user to Firestore.
  ///
  /// • Profile use only.
  // static Future updateProfileImage() async {
  //   try {
  //     String _photoURL = await uploadImage();
  //     if (_photoURL.isNotEmpty) {
  //       UIUtils.showToast('Profil fotoğrafın değiştirildi!');
  //     } else
  //       UIUtils.showToast('Profil fotoğrafı güncellenemedi!');
  //   } catch (e) {
  //     print(e);
  //     UIUtils.showToast(LocalizationService.texts.genericError);
  //   }
  // }
}
