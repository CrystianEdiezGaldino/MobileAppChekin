import 'dart:convert';

import 'package:appregfrequency/app/components/widgets/no_img_widget.dart';
import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:appregfrequency/app/utils/baseapp.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewSelectAssociateWidget extends StatelessWidget {
  final RegfController regfController;
  const ListViewSelectAssociateWidget({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    double sizeScreenWidth = MediaQuery.of(context).size.width;
    return regfController.listOfAssociatesAndDependents.isNotEmpty
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: regfController.listOfAssociatesAndDependents.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    minVerticalPadding: 0.5,
                    title: InkWell(
                      onTap: () {
                        regfController.setlistMultAssociate(
                          regfController.listOfAssociatesAndDependents[index].registro,
                          index, // passa o índice selecionado para a função e adciona na lista
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: sizeScreenWidth,
                            child: Card(
                              color: regfController.listofassociatesselected
                                      .any((item) => item.registro == regfController.listOfAssociatesAndDependents[index].registro)
                                  ? const Color.fromARGB(255, 253, 238, 25)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                //aqui é a parte quadno o usuário está com alguma pendencia

                                children: [
                                  SizedBox(
                                    width: sizeScreenWidth * 0.48,
                                    child: regfController.listOfAssociatesAndDependents[index].status != "1"
                                        ? Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    regfController.listOfAssociatesAndDependents[index].nomeAss,
                                                    style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: textColorBlack)),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        textAlign: TextAlign.end,
                                                        "Registro",
                                                        style: GoogleFonts.roboto(fontSize: 12, color: const Color.fromARGB(255, 0, 0, 0)),
                                                      ),
                                                      Text(regfController.listOfAssociatesAndDependents[index].registro.toString(),
                                                          style: GoogleFonts.roboto(
                                                              color: textColorMsgRegistro, fontSize: 16, fontWeight: FontWeight.bold)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                          textAlign: TextAlign.end,
                                                          "Titulo",
                                                          style: GoogleFonts.roboto(fontSize: 12, color: textColorBlack)),
                                                      Text(
                                                          textAlign: TextAlign.end,
                                                          regfController.listOfAssociatesAndDependents[index].titulo.toString(),
                                                          style:
                                                              GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: textColorBlack)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                  textAlign: TextAlign.center,
                                                  regfController.listOfAssociatesAndDependents[index].associacao,
                                                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0))),
                                              Container(
                                                width: sizeScreenWidth * 0.30,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 3,
                                                        offset: const Offset(0, 2) // changes position of shadow
                                                        )
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                  //CATEGORIA DO TITULO
                                                  color: regfController.listOfAssociatesAndDependents[index].categ.toString() == "Patrimonial"
                                                      ? textColorPatrimonial
                                                      : const Color.fromARGB(255, 255, 220, 23),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      textAlign: TextAlign.center,
                                                      regfController.listOfAssociatesAndDependents[index].categ.toString(),
                                                      style: GoogleFonts.roboto(color: Colors.white)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 4),
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    regfController.listOfAssociatesAndDependents[index].mensagem,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: sizeScreenWidth * 0.035,
                                                        fontWeight: FontWeight.w500,
                                                        color: regfController.listOfAssociatesAndDependents[index].status == "1"
                                                            ? textColorMsgGreen
                                                            : textColorMsgRed)),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    regfController.listOfAssociatesAndDependents[index].nomeAss,
                                                    style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: textColorBlack)),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                          textAlign: TextAlign.end,
                                                          "Registro",
                                                          style: GoogleFonts.roboto(fontSize: 12, color: const Color.fromARGB(255, 0, 0, 0))),
                                                      Text(regfController.listOfAssociatesAndDependents[index].registro.toString(),
                                                          style: GoogleFonts.roboto(
                                                              color: textColorMsgRegistro, fontSize: 16, fontWeight: FontWeight.bold)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                          textAlign: TextAlign.end,
                                                          "Titulo",
                                                          style: GoogleFonts.roboto(fontSize: 12, color: textColorBlack)),
                                                      Text(
                                                          textAlign: TextAlign.end,
                                                          regfController.listOfAssociatesAndDependents[index].titulo.toString(),
                                                          style:
                                                              GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: textColorBlack)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                  textAlign: TextAlign.center,
                                                  regfController.listOfAssociatesAndDependents[index].associacao,
                                                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: textColorBlack)),
                                              Container(
                                                width: sizeScreenWidth * 0.30,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 3,
                                                        offset: const Offset(0, 2) // changes position of shadow
                                                        ),
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                  //CATEGORIA DO TITULO
                                                  color: regfController.listOfAssociatesAndDependents[index].categ == "Patrimonial"
                                                      ? textColorPatrimonial
                                                      : textColorUsuario,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      textAlign: TextAlign.center,
                                                      regfController.listOfAssociatesAndDependents[index].categ,
                                                      style: GoogleFonts.roboto(color: Colors.white)),
                                                ),
                                              ),
                                              Text(
                                                  textAlign: TextAlign.center,
                                                  regfController.listOfAssociatesAndDependents[index].mensagem,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: sizeScreenWidth * 0.035,
                                                      fontWeight: FontWeight.w500,
                                                      color: regfController.listOfAssociatesAndDependents[index].status == "1"
                                                          ? textColorMsgGreen
                                                          : textColorMsgRed)),
                                            ],
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                    child: Container(
                                      height: 180.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: const Offset(0, 2) // changes position of shadow
                                              ),
                                        ],
                                        border: Border.all(
                                          color: regfController.listOfAssociatesAndDependents[index].categ == "Patrimonial"
                                              ? textColorPatrimonial
                                              : textColorUsuario,
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: regfController.listOfAssociatesAndDependents[index].foto != ''
                                              ? MemoryImage(base64Decode(
                                                  regfController.listOfAssociatesAndDependents[index].foto,
                                                ))
                                              : NoImageWidget.getImage(),
                                        ),
                                      ),
                                      width: sizeScreenWidth * 0.30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          )
        : const SizedBox();
  }
}
