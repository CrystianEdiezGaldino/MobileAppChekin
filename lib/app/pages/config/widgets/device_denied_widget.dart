import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceDeniedWidget extends StatelessWidget {
  const DeviceDeniedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: sizeScreen.height * 0.24),
        Card(
          color: const Color.fromARGB(255, 243, 5, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
          elevation: 5,
          shadowColor: const Color.fromARGB(186, 229, 41, 8).withOpacity(0.9),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/imagens/hand_down.png',
                scale: 0.7,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        FittedBox(
          child: Text(
            "Dispositivo não cadastrado",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (Platform.isAndroid || Platform.isIOS) {
                exit(0);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(45),
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sair",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(230, 7, 40, 255),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 7, 40, 255),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
