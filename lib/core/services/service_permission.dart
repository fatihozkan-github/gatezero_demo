import 'package:permission_handler/permission_handler.dart';

import '../UI/shared/utils.dart';

class PermissionService {
  static Future<PermissionStatus> checkCameraPermission() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    if (await Permission.camera.isPermanentlyDenied) {
      await openAppSettings().then((value) async {
        if (await Permission.camera.isGranted) {
          permissionStatus = PermissionStatus.granted;
        }
      });
    }
    return permissionStatus;
  }

  // static Future checkLocationPermission() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
  //       UIUtils.showToast('Konum izni reddedildi, uygulama izinlerini kontrol et!');
  //     }
  //   }
  //   return permission;
  // }

  static Future<PermissionStatus> checkPhotosPermission() async {
    try {
      return await Permission.photos.request();
    } catch (e) {
      UIUtils.showToast('Fotoğraf izni alınamadı, uygulama izinlerini kontrol et!');
      return null;
    }
  }
}
