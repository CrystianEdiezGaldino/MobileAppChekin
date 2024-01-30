import 'package:appregfrequency/app/app_module.dart';
import 'package:appregfrequency/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // defini o app para não girar a tela
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  return runApp(
    ModularApp(module: AppModule(), child: const AppWidget()),
  );
}
