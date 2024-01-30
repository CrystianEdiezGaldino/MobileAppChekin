import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceReleasedWidget extends StatelessWidget {
  final String local;
  final String deviceId;
  final String name;

  const DeviceReleasedWidget({super.key, required this.local, required this.deviceId, required this.name});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: sizeScreen.height * 0.24),
          Card(
            color: const Color.fromARGB(255, 18, 182, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            elevation: 8,
            shadowColor: const Color.fromARGB(187, 8, 229, 74).withOpacity(0.9),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  'assets/imagens/hand_up.png',
                  scale: 0.7,
                ),
              ),
            ),
          ),
          Text(
            "Dispositivo liberado!",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Text(
            "Local: $local",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 243, 192, 6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ID: $deviceId",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 243, 192, 6),
                ),
              ),
            ),
          ),
          Text(
            "Dispositivo: $name",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 243, 192, 6),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: InkWell(
                onTap: () => Modular.to.pushNamed('/default'),
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
                        "Avançar",
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
                          Icons.arrow_forward_ios_outlined,
                          color: Color.fromARGB(255, 7, 40, 255),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
