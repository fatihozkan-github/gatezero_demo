import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../utils/utilities_general.dart';

class ImageService {
  static Future openCameraView() async {
    File file = await GeneralUtils.pickImage(src: ImageSource.camera);
    if (file != null) {
      return file;
    } else
      return null;
  }
}
