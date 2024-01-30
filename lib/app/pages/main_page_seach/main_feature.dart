import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:appregfrequency/app/pages/main_page_seach/main_page.dart';
import 'package:flutter/material.dart';

class MainFeature extends StatefulWidget {
  final RegfController regfController;
  const MainFeature({
    Key? key,
    required this.regfController,
  }) : super(key: key);

  @override
  State<MainFeature> createState() => _RegFeature();
}

class _RegFeature extends State<MainFeature> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: widget.regfController, builder: (context, child) => MainPage(regfController: widget.regfController));
  }
}
