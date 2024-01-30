import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BtnGoToMainWidget extends StatelessWidget {
  const BtnGoToMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.white,
                child: const Icon(Icons.search, size: 30, color: Color.fromRGBO(4, 34, 132, 0.851)),
                onPressed: () async {
                  Modular.to.pushNamed('/default');
                }),
          ],
        ),
      ),
    );
  }
}
