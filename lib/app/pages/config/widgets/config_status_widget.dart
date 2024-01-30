import 'package:appregfrequency/app/pages/config/config_controller.dart';
import 'package:appregfrequency/app/pages/config/model/config_model.dart';
import 'package:appregfrequency/app/pages/config/widgets/device_not_conect_widget.dart';

import 'package:appregfrequency/app/pages/config/widgets/device_released_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'device_denied_widget.dart';
import 'imglogo_widget.dart';

class ConfigStatus extends StatelessWidget {
  final bool isloading;
  final ConfigModelStatus status;
  final String local;
  final String deviceId;
  final String name;
  final ConfigController configController;

  const ConfigStatus({
    super.key,
    required this.isloading,
    required this.status,
    required this.local,
    required this.deviceId,
    required this.name,
    required this.configController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const ImgTopConfigWidget(),
            body(context),
          ],
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    if (isloading) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.4,
        child: const SpinKitCircle(
          size: 80,
          color: Color.fromARGB(248, 56, 137, 242),
        ),
      );
    }
    switch (status) {
      case ConfigModelStatus.liberado:
        return DeviceReleasedWidget(deviceId: deviceId, local: local, name: name);
      case ConfigModelStatus.negado:
        return const DeviceDeniedWidget();
      case ConfigModelStatus.error:
        return DevicenNotConcectWidget(
          configController: configController,
        );
    }
  }
}
