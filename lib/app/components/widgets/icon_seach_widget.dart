import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:flutter/material.dart';

class IconButtonSeasch extends StatelessWidget {
  final RegfController regfController;
  const IconButtonSeasch({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return regfController.isChangeButton == false
        ? const Icon(Icons.search, size: 40, color: Color.fromARGB(255, 7, 40, 255))
        : const CircularProgressIndicator();
  }
}
