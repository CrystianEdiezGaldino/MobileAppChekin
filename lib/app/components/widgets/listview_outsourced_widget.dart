import 'package:appregfrequency/app/components/widgets/success_animation.dart';
import 'package:appregfrequency/app/controllers/controller.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewPrestador extends StatelessWidget {
  final RegfController regfController;
  const ListViewPrestador({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.98,
        child: regfController.listaOfOutsourced.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: regfController.listaOfOutsourced.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
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
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.5,
                                        child: Text(
                                          maxLines: 1,
                                          "DADOS DO PRESTADOR",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: const Color.fromARGB(255, 0, 21, 183),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              regfController.listaOfOutsourced[index].nomePrestador.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(255, 43, 43, 43),
                                              ),
                                            ),
                                            Text(
                                              regfController.listaOfOutsourced[index].cpfCnpj.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(255, 43, 43, 43),
                                              ),
                                            ),
                                            Text(
                                              regfController.listaOfOutsourced[index].tipo.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(255, 43, 43, 43),
                                              ),
                                            ),
                                            Text(
                                              regfController.listaOfOutsourced[index].dtCadastro.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(255, 43, 43, 43),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          regfController.listaOfOutsourced[index].pkLiberacao == 0
                              ? SizedBox(
                                  height: 280,
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: Card(
                                    color: const Color.fromRGBO(224, 52, 46, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        const Text(
                                          "Pré liberação não cadastrada",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 60.0,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.white),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                regfController.dropdownValue,
                                                                textAlign: TextAlign.center,
                                                                style: const TextStyle(fontSize: 20, color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: const Icon(Icons.arrow_drop_down),
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                context: context,
                                                                builder: (context) {
                                                                  return ListView.builder(
                                                                    shrinkWrap: true,
                                                                    itemCount: regfController.listadeSetores.length,
                                                                    itemBuilder: (context, index) {
                                                                      return ListTile(
                                                                        title: Text(
                                                                          regfController.listadeSetores[index]['descricao'].toString(),
                                                                          style: const TextStyle(fontSize: 20),
                                                                        ),
                                                                        onTap: () {
                                                                          regfController.changeNameSetorInput(
                                                                              regfController.listadeSetores[index]['descricao'].toString());
                                                                          regfController.changeIdDestino(
                                                                              regfController.listadeSetores[index]['id_destino'].toString());
                                                                          regfController.changeNameSetorData(
                                                                              regfController.listadeSetores[index]['descricao'].toString());
                                                                          regfController.changeNameSetorData(
                                                                              regfController.listadeSetores[index]['id_destino'].toString());

                                                                          regfController.idDestino =
                                                                              regfController.listadeSetores[index]['id_destino'].toString();

                                                                          Navigator.of(context).pop();
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10.0),
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                                                      child: TextFormField(
                                                        cursorColor: Colors.black,
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 20,
                                                          color: Color.fromARGB(255, 5, 5, 5),
                                                        ),
                                                        controller: regfController.nomeController,
                                                        onChanged: (value) {
                                                          regfController.nomeSolicitante = value;
                                                        },
                                                        decoration: const InputDecoration(
                                                          floatingLabelBehavior: FloatingLabelBehavior.never, // Move o rótulo para baixo
                                                          label: Text(
                                                            "Insira o Nome do Socilitante",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 20,
                                                              color: Color.fromARGB(255, 0, 0, 0),
                                                            ),
                                                          ),
                                                          // hintText: "Senha",
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color.fromARGB(255, 118, 118, 118),
                                                            ),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color.fromARGB(255, 118, 118, 118),
                                                            ),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color.fromARGB(255, 0, 76, 217),
                                                            ),
                                                          ),
                                                          labelStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              maxLines: 1,
                                              "DADOS DO LIBERAÇÃO",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: const Color.fromARGB(255, 0, 21, 183),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Data Liberação: ',
                                                      style: const TextStyle(
                                                          fontSize: 22.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 59, 59, 59)),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: regfController.listaOfOutsourced[index].dataLiberacao,
                                                          style: const TextStyle(
                                                            fontSize: 18.0,
                                                            overflow: TextOverflow.fade,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    textAlign: TextAlign.start,
                                                    text: TextSpan(
                                                      text: 'Destino: ',
                                                      style: const TextStyle(
                                                          fontSize: 22.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 59, 59, 59)),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: regfController.listaOfOutsourced[index].destino,
                                                          style: const TextStyle(
                                                            fontSize: 18.0,
                                                            overflow: TextOverflow.fade,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    textAlign: TextAlign.start,
                                                    text: TextSpan(
                                                      text: 'Liberado por: ',
                                                      style: const TextStyle(
                                                          fontSize: 22.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 59, 59, 59)),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: regfController.listaOfOutsourced[index].usuarioDcadastro,
                                                          style: const TextStyle(
                                                            fontSize: 18.0,
                                                            overflow: TextOverflow.fade,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SucesseImgAnimation()
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
