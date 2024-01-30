import 'dart:convert';

import 'package:appregfrequency/app/components/widgets/no_img_widget.dart';
import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:appregfrequency/app/utils/baseapp.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewAssociteNameWidget extends StatelessWidget {
  final RegfController regfController;

  const ListViewAssociteNameWidget({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return regfController.listOfAssociatesNames.isNotEmpty
        ? SingleChildScrollView(
            child: regfController.listOfAssociatesNames.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.98,
                    child: ListView.builder(
                      itemCount: regfController.listOfAssociatesNames.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => regfController.getListToRegistroAssociate(regfController.listOfAssociatesNames[index]["registro"].toString()),
                          child: SizedBox(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          child: Text(
                                            regfController.listOfAssociatesNames[index]["nome"].toString(),
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: textColorPatrimonial,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            regfController.listOfAssociatesNames[index]["registro"].toString().padLeft(6, "0"),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: textColorMsgRed,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0, right: 5.0),
                                    child: Container(
                                      height: 90.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromARGB(0, 15, 60, 223),
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: regfController.listOfAssociatesNames[index]["foto"] != null ||
                                                  regfController.listOfAssociatesNames[index]["foto"] == ""
                                              ? MemoryImage(base64Decode(
                                                  regfController.listOfAssociatesNames[index]["foto"],
                                                ))
                                              : NoImageWidget.getImage(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 180.0),
                    child: SpinKitThreeBounce(
                      size: 80,
                      color: Color.fromARGB(248, 56, 137, 242),
                    ),
                  ),
          )
        : const SizedBox();
  }

  void getNewListPortaria(String registro) {
    // Implemente a lógica para obter uma nova lista com base no registro.
  }
}
