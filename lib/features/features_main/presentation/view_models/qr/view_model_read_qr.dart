import 'package:flutter/cupertino.dart';
import 'package:gatezero_demo/core/utils/utilities_enums.dart';
import 'package:gatezero_demo/providers/provider_interaction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../../../core/UI/presentation/view_model_base.dart';
import '../../../../../core/services/service_permission.dart';

class ReadQRViewModel extends BaseViewModel {
  bool _permissionStatus = false;
  bool get permissionStatus => _permissionStatus;

  List<String> _productList = [];
  List<String> get productList => _productList;

  ReadQRViewModel() {
    init();
  }

  Future<void> init() async {
    activityState = ActivityState.isLoading;
    await checkPermission();
    activityState = ActivityState.isLoading;
  }

  Future<void> checkPermission() async {
    if (await PermissionService.checkCameraPermission() == PermissionStatus.granted) {
      _permissionStatus = true;
    } else
      _permissionStatus = false;
    notifyListeners();
  }

  void addProduct(String value, BuildContext context) {
    _productList.add(value);
    if (!Provider.of<InteractionProvider>(context, listen: false).recycleList.contains(value))
      Provider.of<InteractionProvider>(context, listen: false).addMaterial(value);
    notifyListeners();
  }
}
