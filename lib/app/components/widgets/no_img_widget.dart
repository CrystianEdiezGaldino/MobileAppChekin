import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({Key? key}) : super(key: key);

  static ImageProvider<Object> getImage() {
    return const AssetImage('assets/imagens/icon.png');
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: getImage());
  }
}
