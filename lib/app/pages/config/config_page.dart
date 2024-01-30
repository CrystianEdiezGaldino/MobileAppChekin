import 'package:appregfrequency/app/pages/config/config_controller.dart';
import 'package:appregfrequency/app/pages/config/widgets/config_status_widget.dart';

import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  final ConfigController configController;
  const ConfigPage({
    super.key,
    required this.configController,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // logic
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 51, 141),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 102, 236, 1),
                      Color.fromRGBO(0, 102, 236, 1),
                      Color.fromRGBO(0, 52, 115, 1),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: ConfigStatus(
                  isloading: configController.isLoading,
                  status: configController.configModel.status,
                  deviceId: configController.deviceId,
                  local: configController.configModel.local,
                  name: configController.configModel.nome,
                  configController: configController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
