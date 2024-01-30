import 'package:appregfrequency/app/components/widgets/base_screen.dart';
import 'package:appregfrequency/app/controllers/controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConvitePage extends StatelessWidget {
  final RegfController regfController;
  const ConvitePage({
    Key? key,
    required this.regfController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSnackbar(BuildContext context, String message) {
      final snackbar = SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), // Ajuste a duração conforme necessário
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    final sizeScreen = MediaQuery.of(context).size.width;
    double fonte20 = MediaQuery.of(context).size.width * 0.05;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (!didPop) {
          return showSnackbar(context, "Click no Icone de Pesquisar para Voltar");
        }
      },
      child: Scaffold(
        // Color.fromARGB(255, 235, 235, 235),
        backgroundColor: const Color.fromARGB(0, 253, 254, 255),
        body: regfController.aguarde == true
            ? Stack(
                children: [
                  const BaseScreen(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Carregando!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  shadows: [
                                    Shadow(color: Colors.black.withOpacity(0.3), blurRadius: 2, offset: const Offset(0, 2)),
                                  ],
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 255, 159, 4)),
                            ),
                          ),
                        ),
                        const SpinKitCircle(size: 80, color: Color.fromARGB(248, 56, 137, 242)),
                      ],
                    ),
                  ),
                ],
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const BaseScreen(),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 200.0,
                                  width: sizeScreen,
                                  decoration:
                                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30.0, bottom: 10),
                                      child: Text(
                                        regfController.convitesModel.status,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.raleway(
                                          fontSize: 45,
                                          color: regfController.convitesModel.status == "Check-In Cadastrado" ? Colors.amber : Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 220.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 230.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(90))),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              style: GoogleFonts.raleway(fontSize: 20, color: const Color.fromRGBO(0, 71, 158, 1)),
                                              children: const [
                                                TextSpan(text: 'Dados do '),
                                                TextSpan(text: 'Convidado', style: TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(15),
                                                    topRight: Radius.circular(15),
                                                    bottomLeft: Radius.circular(90),
                                                    bottomRight: Radius.circular(90),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(regfController.convitesModel.name,
                                                          style: GoogleFonts.raleway(
                                                              fontSize: MediaQuery.of(context).size.width * 0.05, color: Colors.yellow)),
                                                      Text("Titulo: ${regfController.convitesModel.titulosc}",
                                                          style: GoogleFonts.raleway(fontSize: 18, color: const Color.fromARGB(255, 255, 255, 255))),
                                                      Text("CPF: ${regfController.convitesModel.cpf}",
                                                          style: GoogleFonts.raleway(fontSize: 18, color: const Color.fromARGB(255, 255, 255, 255))),
                                                      Text("Data Cdastro: ${regfController.convitesModel.datacd}",
                                                          textAlign: TextAlign.start, style: GoogleFonts.raleway(fontSize: 20, color: Colors.white)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      child: Container(width: sizeScreen, height: 2.0, color: const Color.fromARGB(121, 7, 129, 251)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 230.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(90))),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              style: GoogleFonts.raleway(fontSize: 20, color: const Color.fromRGBO(0, 71, 158, 1)),
                                              children: const [
                                                TextSpan(text: 'Dados do '),
                                                TextSpan(text: 'Convite', style: TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Data da Visita: ${regfController.convitesModel.datavt}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: MediaQuery.of(context).size.width * 0.05, // adjust this factor as needed
                                                        color: Colors.white)),
                                                Text("Convite: ${regfController.convitesModel.codconvite}",
                                                    style: GoogleFonts.raleway(fontSize: 18, color: Colors.white)),
                                                Text("Local do Convite: ${regfController.convitesModel.local}",
                                                    style: GoogleFonts.raleway(fontSize: fonte20, color: const Color.fromARGB(255, 255, 255, 255))),
                                                Text("Tipo do Convite: ${regfController.convitesModel.tipocv}",
                                                    textAlign: TextAlign.start, style: GoogleFonts.raleway(fontSize: 20, color: Colors.white)),
                                                Text("Descrição do Convite: ${regfController.convitesModel.dcconvite}",
                                                    textAlign: TextAlign.start, style: GoogleFonts.raleway(fontSize: fonte20, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    regfController.convitesModel.status == "Check-In Cadastrado"
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                await regfController.cancelCheckinConvite(regfController.convitesModel.codconvite);
                                                regfController.newSeachAssociate(false);
                                              },
                                              // checkConviteCancel(),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(255, 242, 45, 45),
                                                  border: Border.all(color: const Color.fromARGB(255, 255, 147, 147), width: 1),
                                                  borderRadius: BorderRadius.circular(45),
                                                ),
                                                width: sizeScreen,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Cancelar Check-In",
                                                      style: GoogleFonts.raleway(
                                                          textStyle: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
                                                    ),
                                                    const Padding(
                                                        padding: EdgeInsets.only(left: 10.0),
                                                        child: Icon(Icons.free_cancellation_outlined, color: Colors.white))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          child: const Icon(Icons.search, size: 30, color: Color.fromRGBO(4, 34, 132, 0.851)),
                                          onPressed: () async {
                                            regfController.clearList();
                                            Modular.to.pushNamed('/default');
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
