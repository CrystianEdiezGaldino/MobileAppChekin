import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:flutter/material.dart';

class IconButtonQrCode extends StatelessWidget {
  final RegfController regfController;
  const IconButtonQrCode({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return regfController.isChangeButton == false
        ? const Icon(Icons.qr_code, size: 40, color: Color.fromARGB(255, 7, 40, 255))
        : const CircularProgressIndicator();
  }
}
