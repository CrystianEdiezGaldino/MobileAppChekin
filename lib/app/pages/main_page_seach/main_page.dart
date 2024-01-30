import 'package:appregfrequency/app/components/widgets/appbar_img_widget.dart';
import 'package:appregfrequency/app/components/widgets/drawer.dart';
import 'package:appregfrequency/app/components/widgets/listview_associate_name_widget.dart';
import 'package:appregfrequency/app/components/widgets/listview_invitation.dart';
import 'package:appregfrequency/app/components/widgets/listview_outsourced_widget.dart';
import 'package:appregfrequency/app/components/widgets/listview_select_associate_widget.dart';
import 'package:appregfrequency/app/components/widgets/search_field_widget.dart';
import 'package:appregfrequency/app/controllers/controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  final RegfController regfController;

  const MainPage({super.key, required this.regfController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 102, 236, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              heroTag: "Menu",
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              child: Image.asset('assets/imagens/menu.png', fit: BoxFit.fill),
            );
          },
        ),
        automaticallyImplyLeading: true,
        title: const AppBarImgWidget(),
      ),
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 102, 236, 1),
                  Color.fromRGBO(0, 102, 236, 1),
                  Color.fromRGBO(0, 52, 115, 1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            regfController.titlePage,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 30.0,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 3.0,
                          color: const Color.fromARGB(121, 3, 71, 139),
                        ),
                      ),
                    ],
                  ),
                  // AppbarCustom(
                  //   regfController: regfController,
                  // ),
                  regfController.isnewSeach
                      ? const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 180.0),
                            child: SpinKitFadingCircle(size: 150.0, color: Color.fromARGB(248, 225, 225, 225)),
                          ),
                        )
                      : Expanded(
                          child: regfController.typePage == 'F'
                              ? regfController.listOfAssociatesNames.isEmpty
                                  ? ListViewSelectAssociateWidget(
                                      regfController: regfController,
                                    )
                                  : ListViewAssociteNameWidget(
                                      regfController: regfController,
                                    )
                              : regfController.typePage == 'C'
                                  ? ListViewConvites(
                                      regfController: regfController,
                                    )
                                  : regfController.typePage == 'P'
                                      ? ListViewPrestador(regfController: regfController)
                                      : const SizedBox(),
                        ),
                  regfController.isnewSeach
                      ? const SizedBox()
                      : SeachFiledWidget(
                          textEditingController: regfController.textController,
                          regfController: regfController,
                        )
                ],
              ),
            )),
      ),
      drawer: DrawerPage(
        regfController: regfController,
      ),
    );
  }
}
