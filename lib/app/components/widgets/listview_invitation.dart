import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListViewConvites extends StatelessWidget {
  final RegfController regfController;
  const ListViewConvites({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: regfController.membersInvitationList.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.98,
                child: ListView.builder(
                  itemCount: regfController.membersInvitationList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        if (regfController.membersInvitationList[index]["pk_convite"] != 0) {
                          await regfController.getInviteByNumber(regfController.membersInvitationList[index]["pk_convite"].toString());
                          regfController.membersInvitationList.clear();
                          Modular.to.pushNamed('/chekin_invite');
                        } else {
                          regfController.clearList();
                        }
                      },
                      child: SizedBox(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width / 1.5,
                                            child: Text(
                                                regfController.convitesModel.name.toString() != ""
                                                    ? regfController.convitesModel.name.toString()
                                                    : regfController.membersInvitationList[index]['pk_convite'].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 71, 158), fontSize: 20),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        regfController.convitesModel.codconvite.toString() != ""
                                            ? regfController.convitesModel.codconvite.toString()
                                            : regfController.membersInvitationList[index]['vc_nome'].toString(),
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 7, 7)),
                                      ),
                                      Text(
                                        regfController.convitesModel.dcconvite.toString() != ""
                                            ? regfController.convitesModel.dcconvite.toString()
                                            : regfController.membersInvitationList[index]['vc_observacao'].toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 71, 158),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox());
  }
}
