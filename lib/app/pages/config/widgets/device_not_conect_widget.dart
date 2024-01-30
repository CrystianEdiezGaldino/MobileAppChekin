import 'package:appregfrequency/app/pages/config/config_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DevicenNotConcectWidget extends StatelessWidget {
  final ConfigController configController;
  const DevicenNotConcectWidget({super.key, required this.configController});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: sizeScreen.height * 0.30),
            const Icon(Fontisto.wifi_logo, size: 64.0, color: Colors.white),
            const SizedBox(height: 16.0),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Sem Conexão à ',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Internet',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Verifique sua conexão e tente novamente.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.50,
              child: ElevatedButton(
                // ignore: prefer_const_constructors
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0), // Ajuste o valor conforme necessário
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => configController.initConfig(),
                child: Text(
                  "Tentar Novamente",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
