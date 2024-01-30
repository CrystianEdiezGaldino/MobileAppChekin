// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListAssociateModel extends ChangeNotifier {
  String associacao = "";
  String categ = "";
  int registro = 0;
  int titulo = 0;
  String dcGrupo = "";
  String nomeAss = "";
  String mensagem = "";
  String status = "";
  String foto = "";
  ListAssociateModel({
    required this.associacao,
    required this.categ,
    required this.registro,
    required this.titulo,
    required this.dcGrupo,
    required this.nomeAss,
    required this.mensagem,
    required this.status,
    required this.foto,
  });

  ListAssociateModel copyWith({
    String? associacao,
    String? categ,
    int? registro,
    int? titulo,
    String? dcGrupo,
    String? nomeAss,
    String? mensagem,
    String? status,
    String? foto,
  }) {
    return ListAssociateModel(
      associacao: associacao ?? this.associacao,
      categ: categ ?? this.categ,
      registro: registro ?? this.registro,
      titulo: titulo ?? this.titulo,
      dcGrupo: dcGrupo ?? this.dcGrupo,
      nomeAss: nomeAss ?? this.nomeAss,
      mensagem: mensagem ?? this.mensagem,
      status: status ?? this.status,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'associacao': associacao,
      'categ': categ,
      'registro': registro,
      'titulo': titulo,
      'dcGrupo': dcGrupo,
      'nomeAss': nomeAss,
      'mensagem': mensagem,
      'status': status,
      'foto': foto,
    };
  }

  factory ListAssociateModel.fromMap(Map<String, dynamic> map) {
    return ListAssociateModel(
      associacao: map['associacao'] ?? "Sem Associação",
      categ: map['categ'] ?? "Sem Categoria ",
      registro: map['Registro'] ?? "Não Informado",
      titulo: map['Titulo'] ?? "Não Informado",
      dcGrupo: map['DcGrupo'] ?? "Não Informado",
      nomeAss: map['NomeAss'] ?? "Não Informado",
      mensagem: map['Mensagem'] ?? "Não Informado",
      status: map['Status'] ?? "Não Informado",
      foto: map['Foto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListAssociateModel.fromJson(String source) => ListAssociateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListAssociateModel(associacao: $associacao, categ: $categ, registro: $registro, titulo: $titulo, dcGrupo: $dcGrupo, nomeAss: $nomeAss, mensagem: $mensagem, status: $status, foto: $foto)';
  }

  @override
  bool operator ==(covariant ListAssociateModel other) {
    if (identical(this, other)) return true;

    return other.associacao == associacao &&
        other.categ == categ &&
        other.registro == registro &&
        other.titulo == titulo &&
        other.dcGrupo == dcGrupo &&
        other.nomeAss == nomeAss &&
        other.mensagem == mensagem &&
        other.status == status &&
        other.foto == foto;
  }

  @override
  int get hashCode {
    return associacao.hashCode ^
        categ.hashCode ^
        registro.hashCode ^
        titulo.hashCode ^
        dcGrupo.hashCode ^
        nomeAss.hashCode ^
        mensagem.hashCode ^
        status.hashCode ^
        foto.hashCode;
  }
}
