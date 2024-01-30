import 'dart:convert';

import 'package:appregfrequency/app/model/list_associate_model.dart';
import 'package:appregfrequency/app/model/prestador_model.dart';
import 'package:appregfrequency/app/model/convites_model.dart';
import 'package:appregfrequency/app/utils/baseapp.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'dart:convert' as convert;

class RegfController extends ChangeNotifier {
  String idDevice = '';
  String status = '';
  String regOrInvite = '';
  String textseachInput = 'Registro, nome ou *Titulo';
  String titlePage = 'Frequência Familiar';
  String typePage = 'F';
  String dropdownValue = 'Selecione O Setor';
  String dropdownValueSelected = '';
  String solicitante = '';
  String idDestino = '';
  String idSetor = '';
  String idPrestador = '';
  String statusPortaria = '';
  List listadeSetores = [];
  String nomeSolicitante = '';

  bool isChangeButton = false;
  bool iswalkToCar = false;
  bool isLoading = false;
  bool isnewSeach = false;
  bool isChangeColorCard = false;
  bool showWidget = true;
  bool aguarde = false;
  bool cancelCheckIn = false;

  double currentvol = 0.5;

  ValueNotifier<String> textInInput = ValueNotifier<String>('');

  TextEditingController nomeController = TextEditingController();
  TextEditingController textController = TextEditingController();
  List<dynamic> membersInvitationList = [];
  List<ListAssociateModel> listOfAssociatesAndDependents = [];
  List<ConvitesModel> listOfInvites = [];
  List<dynamic> listOfAssociatesNames = [];
  List<ListAssociateModel> listofassociatesselected = [];
  List<PrestadorModel> listaOfOutsourced = [];

  ConvitesModel convitesModel = ConvitesModel(
    name: '',
    cpf: '',
    titulosc: '',
    datacd: '',
    datavt: '',
    local: '',
    tipocv: '',
    dcconvite: '',
    status: '',
    codconvite: '',
  );

  PrestadorModel prestadorModel = PrestadorModel(
    nomePrestador: '',
    idPrestador: '',
    nomeEmpresa: '',
    cpfCnpj: '',
    tipo: '',
    dtCadastro: '',
    pkLiberacao: 0,
    dataLiberacao: '',
    destino: '',
    usuarioDcadastro: '',
  );

  setStringSeachInput() {
    switch (typePage) {
      case 'F':
        textseachInput = 'Registro, Nome ou *Titulo';
        notifyListeners();

        break;
      case 'C':
        textseachInput = 'Cod.Convite Ou Nome';
        notifyListeners();

        break;
      case 'P':
        textseachInput = 'CPF DA LIBERAÇÃO';
        notifyListeners();

        break;
      default:
        textseachInput = 'erro';
    }
  }

  void readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#0000FF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    regOrInvite = code != '-1' ? code : 'Registro Inválido';
    notifyListeners();
    if (regOrInvite != "" && regOrInvite != "Registro Inválido" && regOrInvite != "-1") {
      if (typePage == "F") {
        getListToRegistroAssociate(regOrInvite);
      } else {
        await getInviteByNumber(regOrInvite);
        if (convitesModel.status != "Convite invalido") {
          playAudioConfirm();
          Modular.to.pushNamed('/chekin_invite');
        } else {
          handleErrorResponse();
        }
      }
    }
  }

//Obtem o id device do dispositivo
  Future<void> initDevice() async {
    idDevice = (await PlatformDeviceId.getDeviceId) ?? '';
    notifyListeners();
  }

//Define a lita de associados para registra freencia isso é quando seleciona o associado eo card fica amarelo
  Future<void> setlistMultAssociate(int registroAssocite, int index) async {
    bool found = false;
    for (int i = 0; i < listofassociatesselected.length; i++) {
      if (listofassociatesselected[i].registro == registroAssocite) {
        listofassociatesselected.removeAt(i);
        changeShowSheach(true);
        found = true;
        break;
      }
    }

    if (!found) {
      // cria uma nova instancia de ListAssociateModel
      ListAssociateModel newAssociate = ListAssociateModel(
        associacao: "SomeAssociation",
        categ: "SomeCategory",
        registro: registroAssocite,
        titulo: 0,
        dcGrupo: '',
        nomeAss: '',
        mensagem: '',
        status: '',
        foto: '',
      );

      listofassociatesselected.add(newAssociate);
      listOfAssociatesAndDependents[index].registro = registroAssocite;
      changeShowSheach(true);
      notifyListeners();
    }
  }

  void changeButtonInSearchInput(bool isChange) {
    isChangeButton = isChange;
    notifyListeners();
  }

  void playAudioSucess() {
    AudioPlayer().play(AssetSource('bip.mp3'));
  }

  void playAudioError() {
    AudioPlayer().play(AssetSource('error.mp3'));
  }

  void playAudioConfirm() {
    AudioPlayer().play(AssetSource('bipsucess.mp3'));
  }

  void changeColorCard(bool value) {
    isChangeColorCard = value;

    notifyListeners();
  }

  void setWalkOrCar() {
    iswalkToCar = !iswalkToCar;
    notifyListeners();
  }

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  newSeachAssociate(bool seach) {
    isnewSeach = seach;
    notifyListeners();
  }

  changeNameSetorInput(String setor) {
    dropdownValue = setor;
    notifyListeners();
  }

  changeNameSetorData(String setorid) {
    idSetor = setorid;
    notifyListeners();
  }

  changeSolicitanteInput(String solictante) {
    solicitante = solictante;
    notifyListeners();
  }

  changeIdDestino(String destino) {
    idDestino = destino;

    notifyListeners();
  }

//define o type da pagina
  String setTitlePage(String type) {
    clearList();
    changeShowSheach(true);
    typePage = type;
    setStringSeachInput();
    notifyListeners();
    switch (type) {
      case 'F':
        titlePage = 'Frequência Familiar';
        notifyListeners();

        break;
      case 'C':
        titlePage = 'Registro de Convites';
        notifyListeners();

        break;
      case 'P':
        titlePage = 'Liberação Portária';
        notifyListeners();

        break;
      default:
        titlePage = 'erro';
    }

    return titlePage;
  }

  void initSearchAssociate(String value) async {
    newSeachAssociate(true);
    clearList();
    notifyListeners();
    String text = textController.text;
    bool isStar = text.isNotEmpty && text[0] == "*" || int.tryParse(text) == null;

    switch (typePage) {
      case "F":
        if (isStar) {
          if (text[0] == "*") {
            //Busca por Titulo
            getListToRegistroAssociate(text);
          } else {
            //Busca por Nome
            getListToNameAssociate(value);
          }
        } else {
          //Busca por Registro
          getListToRegistroAssociate(value);
        }
        break;
      //Busca por Convites
      case "C":
        if (int.tryParse(text) == null) {
          //Busca de Convites por Nome
          getInviteByName(value);
        } else {
          //Busca de Convites por numero do convite
          await getInviteByNumber(value);
          if (convitesModel.codconvite != '') {
            playAudioConfirm();
            Modular.to.pushNamed('/chekin_invite');
          } else {
            handleErrorResponse();
          }
        }
        break;

      default:
        //Busca por CPF para Prestadores e Terceiros
        getOutsourced(value);
        break;
    }

    textController.text = '';
    textInInput.value = '';
  }

  setTypePage(String type) {
    typePage = type;

    notifyListeners();
  }

//Limpa as Todas as litas
  void clearList() {
    nomeController.text = '';
    changeLoading(false);
    newSeachAssociate(false);
    changeButtonInSearchInput(false);
    listofassociatesselected.clear();
    membersInvitationList.clear();
    listOfAssociatesAndDependents.clear();
    listOfAssociatesNames.clear();
    listaOfOutsourced.clear();
    changeShowSheach(true);
    notifyListeners();
  }

//Obtem uma lista de associados por Nome
  Future<void> getListToNameAssociate(String name) async {
    newSeachAssociate(true);
    changeIsLoading(true);
    notifyListeners();
    try {
      await initDevice();
      var response = await Dio().post(
        '$baseUrl',
        data: {'nome': name, 'id_device': idDevice},
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.data);

        if (responseData.isNotEmpty) {
          listOfAssociatesNames = responseData;
          newSeachAssociate(false);
          playAudioSucess();
          notifyListeners();
        }
      }
      await newSeachAssociate(false);
    } catch (e) {
      handleErrorResponse(exception: e);
    }
  }

//Obtem uma lista de associados por Titulo
  Future getListToRegistroAssociate(String value) async {
    clearList();
    await newSeachAssociate(true);
    try {
      await initDevice();
      var response = await Dio().post(
        '$baseUrl',
        data: {'nome': value, 'id_device': idDevice},
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.data);
        listOfAssociatesAndDependents = responseData.map((map) => ListAssociateModel.fromMap(map)).toList();
        playAudioSucess();
        notifyListeners();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
    await newSeachAssociate(false);
  }

//Cancela o Chekin do CONVITE
  Future<void> cancelCheckin(String value) async {
    try {
      var response = await Dio().post('$baseUrl', data: {'cod_convite': value});
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.data) as Map<String, dynamic>;
        status = jsonResponse["status"];
        notifyListeners();
      } else {
        handleErrorResponse();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
    await newSeachAssociate(false);
  }

//Envia um ou mais registro de associados para registra a frequência
  Future<void> sendListRegistroAssociate(List registros, String walkOrCar) async {
    changeIsLoading(true);
    newSeachAssociate(true);
    initDevice();
    try {
      // Extraindo 'registro' de cada ListAssociateModel em list_of_associates_selected
      List<Map<String, String>> registrosList = [];
      for (var associate in listofassociatesselected) {
        registrosList.add({'registro': associate.registro.toString()});
      }

      var response = await Dio().post(
        '$baseUrl/',
        data: {'registros': jsonEncode(registrosList), 'carro': walkOrCar, 'idDevice': idDevice},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.data);
        var jsonResponse = data.first;
        var validatestatus = jsonResponse["status"];
        if (validatestatus != "") {
          changeIsLoading(false);
          playAudioConfirm();
          notifyListeners();
          clearList();
          changeShowSheach(true);
        }
      } else {
        handleErrorResponse();
      }
    } catch (e) {
      // Handle exceptions
      handleErrorResponse(exception: e);
    }
  }

//Função para tratar os principais ERROS EM GERAL
  void handleErrorResponse({Object? exception}) {
    textInInput.value = '';
    textController.text = '';
    convitesModel.dcconvite = '';
    newSeachAssociate(false);
    playAudioError();
    clearList();
    listofassociatesselected.clear();
    changeIsLoading(false);
  }

  //Limpa o convitesModel
  cleanDataConvites() {
    convitesModel =
        ConvitesModel(name: '', cpf: '', titulosc: '', datacd: '', datavt: '', local: '', tipocv: '', dcconvite: '', status: '', codconvite: '');
    notifyListeners();
  }

  changeLoading(bool loading) {
    aguarde = loading;
    notifyListeners();
  }

  //Obtem lista de convites por  nome
  Future<void> getInviteByName(String name) async {
    newSeachAssociate(true);
    changeIsLoading(false);
    clearList();
    cleanDataConvites();
    initDevice();
    try {
      var response = await Dio().post('$baseUrl/', data: {'nome': name, 'id_device': idDevice});
      if (response.statusCode == 200) {
        membersInvitationList = jsonDecode(response.data);
        notifyListeners();
        playAudioSucess();
        if (membersInvitationList.first["pk_convite"] == 0) {
          isInviteInvalid();
        } else {}
        notifyListeners();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }

    newSeachAssociate(false);
  }

  //Define o convite quando o convite é invalido
  void isInviteInvalid() {
    int pkConvite = membersInvitationList.first["pk_convite"];
    String vcNome = membersInvitationList.first["vc_nome"];
    String vcObservacao = membersInvitationList.first["vc_observacao"];
    convitesModel = convitesModel = ConvitesModel(
        name: vcNome,
        cpf: '',
        titulosc: '',
        datacd: '',
        datavt: '',
        local: '',
        tipocv: '',
        dcconvite: vcObservacao,
        status: '',
        codconvite: pkConvite.toString());
    playAudioError();
    notifyListeners();
  }

  //Obtem lista de convites pelo numero do convite
  Future<void> getInviteByNumber(String convite) async {
    try {
      await initDevice();
      var response = await Dio().post('$baseUrl/', data: {'cod_convite': convite, 'id_device': idDevice});
      if (response.data != "") {
        convitesModel = ConvitesModel.fromJson(response.data);
        notifyListeners();
        changeLoading(false);
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
    newSeachAssociate(false);
  }

  //Cancela Chekin do Convite
  Future<void> cancelCheckinConvite(String convite) async {
    try {
      var response = await Dio().post('$baseUrl', data: {'cod_convite': convite});
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.data) as Map<String, dynamic>;
        status = jsonResponse["status"];
        convitesModel.status = status;
        notifyListeners();
      } else {
        handleErrorResponse();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
  }

  void changeShowSheach(bool value) {
    showWidget = value;
    if (typePage == "F") {
      if (listofassociatesselected.isNotEmpty) {
        showWidget = false;
      } else {
        showWidget = true;
      }
    }
    notifyListeners();
  }

//Obtem os dados da liberação para terceiros
  Future<void> getOutsourced(String cpf) async {
    initDevice();
    clearList();
    newSeachAssociate(true);
    try {
      var response = await Dio().post('$baseUrl/', data: {'cpf': cpf, 'id_device': idDevice});
      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.data);
        listaOfOutsourced = responseData.map((map) => PrestadorModel.fromMap(map)).toList();
        prestadorModel = listaOfOutsourced.first;
        playAudioSucess();
        changeShowSheach(false);
        await getSectorList();
        notifyListeners();
      } else {
        handleErrorResponse();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
    newSeachAssociate(false);
  }

  Future<void> getSectorList() async {
    try {
      var response = await Dio().get('$baseUrl/');
      if (response.statusCode == 200) {
        listadeSetores = jsonDecode(response.data);
        notifyListeners();
      } else {
        handleErrorResponse();
      }
    } catch (e) {
      handleErrorResponse(exception: e);
    }
  }

  Future<void> authorizeStaffAndOutsourcing(String idPrestador, String idDestino, String solicitante, String pkLiberacao, String carro) async {
    initDevice();
    try {
      var response = await Dio().post('$baseUrl/', data: {
        'idPrestador': idPrestador,
        'idDestino': idDestino,
        'solicitante': solicitante,
        'pk_liberacao': pkLiberacao,
        'carro': carro,
        'idDevice': idDevice
      });

      if (response.statusCode == 200) {
        listaOfOutsourced.clear();
        await changeNameSetorInput("Selecione O Setor");
        List<dynamic> data = jsonDecode(response.data);
        var jsonResponse = data.first;
        statusPortaria = jsonResponse["status"];
        if (statusPortaria == "1") {
          clearList();
          changeShowSheach(true);
          playAudioConfirm();
        } else {
          handleErrorResponse();
        }
        notifyListeners();
      }
    } catch (e) {
      // ignore: avoid_print
      handleErrorResponse(exception: e);
    }
  }
}
