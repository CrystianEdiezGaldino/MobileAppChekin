import 'package:appregfrequency/app/pages/config/config_page.dart';
import 'package:flutter/material.dart';
import 'config_controller.dart';

class ConfigFeature extends StatefulWidget {
  final ConfigController configController;
  const ConfigFeature({
    Key? key,
    required this.configController,
  }) : super(key: key);

  @override
  State<ConfigFeature> createState() => _ConfigPage();
}

class _ConfigPage extends State<ConfigFeature> {
  @override
  void initState() {
    widget.configController.initConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: widget.configController, builder: (context, child) => ConfigPage(configController: widget.configController));
  }
}
