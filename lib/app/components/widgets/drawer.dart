import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatelessWidget {
  final RegfController regfController;
  const DrawerPage({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    void setDefault(String typepage) {
      regfController.textInInput.value = '';
      FocusScope.of(context).unfocus();
      Scaffold.of(context).closeDrawer();
      regfController.setTitlePage(typepage);
      regfController.textController.text = '';
      Scaffold.of(context).closeDrawer();
    }

    double sizeScreen = MediaQuery.of(context).size.width;
    double sizeScreenHeigth = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      width: sizeScreen * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: sizeScreenHeigth * 0.2),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => setDefault("F"),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.family_restroom,
                                size: 40,
                                color: Color.fromRGBO(0, 71, 158, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Frequência Família",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Container(
                            width: sizeScreen * 0.8,
                            height: 1.0,
                            color: const Color.fromARGB(63, 0, 3, 5),
                          ),
                        ),
                        InkWell(
                          onTap: () => setDefault("C"),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.content_paste_go_outlined,
                                size: 40,
                                color: Color.fromRGBO(0, 71, 158, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Registro de convites",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Container(
                            width: sizeScreen * 0.8,
                            height: 1.0,
                            color: const Color.fromARGB(63, 0, 3, 5),
                          ),
                        ),
                        InkWell(
                          onTap: () => setDefault("P"),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.local_shipping,
                                size: 40,
                                color: Color.fromRGBO(0, 71, 158, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Liberação Portária",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Container(
                            width: sizeScreen * 0.8,
                            height: 1.0,
                            color: const Color.fromARGB(63, 0, 3, 5),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setDefault("F");
                            Modular.to.pushReplacementNamed('/config');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                size: 40,
                                color: Color.fromRGBO(0, 71, 158, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Configuração",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
