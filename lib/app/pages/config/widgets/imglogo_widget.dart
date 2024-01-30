import 'package:flutter/material.dart';

class ImgTopConfigWidget extends StatelessWidget {
  const ImgTopConfigWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen.height * 0.50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imagens/imglogoconfig.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
