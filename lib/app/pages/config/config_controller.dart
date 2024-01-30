import 'package:appregfrequency/app/utils/baseapp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:platform_device_id/platform_device_id.dart';
import 'model/config_model.dart';

class ConfigController extends ChangeNotifier {
  ConfigModel configModel = ConfigModel(nome: "", local: "", status: ConfigModelStatus.error);

  String deviceId = '';
  bool isLoading = false;

  changeLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void handleErrorResponse({Object? exception}) {
    configModel = ConfigModel(nome: "", local: "", status: ConfigModelStatus.error);
    isLoading = false;
    notifyListeners();
  }

  Future<void> initDevice() async {
    deviceId = (await PlatformDeviceId.getDeviceId) ?? '';
    notifyListeners();
  }

  Future<void> initConfig() async {
    changeLoading(true);
    await initDevice();
    try {
      var response = await Dio().post('$baseUrl/', data: {'id_decive': deviceId});
      if (response.data != "") {
        configModel = ConfigModel.fromJson(response.data);
        changeLoading(false);
      }
      notifyListeners();
    } catch (e) {
      // Trata o erro.
      handleErrorResponse(exception: e);
    }
  }
}
