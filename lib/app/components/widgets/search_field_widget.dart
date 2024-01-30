import 'package:appregfrequency/app/components/widgets/btn_change_car_to_walk_widget.dart';
import 'package:appregfrequency/app/components/widgets/icon_qrcode_widet.dart';
import 'package:appregfrequency/app/components/widgets/icon_seach_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:appregfrequency/app/controllers/controller.dart';

import 'package:appregfrequency/app/utils/baseapp.dart';

class SeachFiledWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final RegfController regfController;

  const SeachFiledWidget({super.key, required this.textEditingController, required this.regfController});

  @override
  Widget build(BuildContext context) {
    void resetAndCallController() {
      if (regfController.textController.text.isNotEmpty) {
        regfController.textInInput.value = '';
        regfController.initSearchAssociate(regfController.textController.text);
        regfController.textController.text = '';
        FocusScope.of(context).unfocus();
      }
    }

    void validadeAndSetFrenquence() {
      if (regfController.prestadorModel.pkLiberacao != 0) {
        regfController.authorizeStaffAndOutsourcing(regfController.prestadorModel.idPrestador, "", "",
            regfController.prestadorModel.pkLiberacao.toString(), regfController.iswalkToCar ? "1" : "0");
      } else if (regfController.prestadorModel.idPrestador.isNotEmpty &&
          regfController.idDestino.isNotEmpty &&
          regfController.nomeSolicitante.isNotEmpty) {
        regfController.authorizeStaffAndOutsourcing(regfController.prestadorModel.idPrestador, regfController.idDestino,
            regfController.nomeSolicitante, "", regfController.iswalkToCar ? "1" : "0");
      }
    }

    return regfController.showWidget
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textEditingController,
              onChanged: (text) {
                regfController.textInInput.value = text;
              },
              readOnly: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: regfController.textseachInput,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  suffixIcon: ValueListenableBuilder(
                      valueListenable: regfController.textInInput,
                      builder: (BuildContext context, String value, Widget? child) {
                        return regfController.typePage == "F" || regfController.typePage == "C"
                            ? value.isNotEmpty
                                ? FloatingActionButton(
                                    heroTag: "seach",
                                    elevation: 0,
                                    backgroundColor: colorActionButton,
                                    child: IconButtonSeasch(regfController: regfController),
                                    onPressed: () => resetAndCallController())
                                : FloatingActionButton(
                                    heroTag: "qrcode",
                                    elevation: 0,
                                    backgroundColor: colorActionButton,
                                    child: IconButtonQrCode(regfController: regfController),
                                    onPressed: () => regfController.readQRCode(),
                                  )
                            : FloatingActionButton(
                                heroTag: "seach",
                                elevation: 0,
                                backgroundColor: colorActionButton,
                                child: IconButtonSeasch(regfController: regfController),
                                onPressed: () => resetAndCallController());
                      })),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        regfController.setWalkOrCar();
                      },
                      child: BtnChangeCarToWalkWidget(
                        regfController: regfController,
                      )),
                  InkWell(
                    onTap: () {
                      regfController.clearList();
                      regfController.changeShowSheach(true);
                    },
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.close, size: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: regfController.isLoading == true
                        ? const SpinKitCircle(
                            size: 80,
                            color: Color.fromARGB(248, 56, 137, 242),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.white),
                            onPressed: () {
                              if (regfController.typePage == "F") {
                                regfController.sendListRegistroAssociate(
                                    regfController.listofassociatesselected, regfController.iswalkToCar ? "1" : "0");
                              } else {
                                validadeAndSetFrenquence();
                              }
                            },
                            child: Text(
                              "Registrar Frequência",
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20, color: textColor, fontWeight: FontWeight.bold)),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
  }
}
