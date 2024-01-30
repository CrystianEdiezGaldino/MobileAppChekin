import 'package:flutter/material.dart';

class AppBarImgWidget extends StatelessWidget {
  const AppBarImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: Image.asset('assets/imagens/logo.png', fit: BoxFit.fill),
        ),
      ],
    );
  }
}
