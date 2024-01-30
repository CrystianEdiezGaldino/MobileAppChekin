// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrestadorModel extends ChangeNotifier {
  String nomePrestador = '';
  String idPrestador = '';
  String nomeEmpresa = '';
  String cpfCnpj = '';
  String tipo = '';
  String dtCadastro = '';
  int pkLiberacao = 0;
  String dataLiberacao = '';
  String destino = '';
  String usuarioDcadastro = '';
  PrestadorModel({
    required this.nomePrestador,
    required this.idPrestador,
    required this.nomeEmpresa,
    required this.cpfCnpj,
    required this.tipo,
    required this.dtCadastro,
    required this.pkLiberacao,
    required this.dataLiberacao,
    required this.destino,
    required this.usuarioDcadastro,
  });

  PrestadorModel copyWith({
    String? nomePrestador,
    String? idPrestador,
    String? nomeEmpresa,
    String? cpfCnpj,
    String? tipo,
    String? dtCadastro,
    int? pkLiberacao,
    String? dataLiberacao,
    String? destino,
    String? usuarioDcadastro,
  }) {
    return PrestadorModel(
      nomePrestador: nomePrestador ?? this.nomePrestador,
      idPrestador: idPrestador ?? this.idPrestador,
      nomeEmpresa: nomeEmpresa ?? this.nomeEmpresa,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      tipo: tipo ?? this.tipo,
      dtCadastro: dtCadastro ?? this.dtCadastro,
      pkLiberacao: pkLiberacao ?? this.pkLiberacao,
      dataLiberacao: dataLiberacao ?? this.dataLiberacao,
      destino: destino ?? this.destino,
      usuarioDcadastro: usuarioDcadastro ?? this.usuarioDcadastro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomePrestador': nomePrestador,
      'idPrestador': idPrestador,
      'nomeEmpresa': nomeEmpresa,
      'cpfCnpj': cpfCnpj,
      'tipo': tipo,
      'dtCadastro': dtCadastro,
      'pkLiberacao': pkLiberacao,
      'dataLiberacao': dataLiberacao,
      'destino': destino,
      'usuarioDcadastro': usuarioDcadastro,
    };
  }

  factory PrestadorModel.fromMap(Map<String, dynamic> map) {
    return PrestadorModel(
      nomePrestador: map['nome_prestador'] ?? '',
      idPrestador: map['id_prestador'] ?? '',
      nomeEmpresa: map['nome_empresa'] ?? '',
      cpfCnpj: map['cpf_cnpj'] ?? '',
      tipo: map['tipo'] ?? '',
      dtCadastro: map['dt_cadastro'] ?? '',
      pkLiberacao: map['pk_liberacao'] ?? 0,
      dataLiberacao: map['data_liberacao'] ?? '',
      destino: map['destino'] ?? '',
      usuarioDcadastro: map['usuario_cadastro'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PrestadorModel.fromJson(String source) => PrestadorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrestadorModel(nomePrestador: $nomePrestador, idPrestador: $idPrestador, nomeEmpresa: $nomeEmpresa, cpfCnpj: $cpfCnpj, tipo: $tipo, dtCadastro: $dtCadastro, pkLiberacao: $pkLiberacao, dataLiberacao: $dataLiberacao, destino: $destino, usuarioDcadastro: $usuarioDcadastro)';
  }

  @override
  bool operator ==(covariant PrestadorModel other) {
    if (identical(this, other)) return true;

    return other.nomePrestador == nomePrestador &&
        other.idPrestador == idPrestador &&
        other.nomeEmpresa == nomeEmpresa &&
        other.cpfCnpj == cpfCnpj &&
        other.tipo == tipo &&
        other.dtCadastro == dtCadastro &&
        other.pkLiberacao == pkLiberacao &&
        other.dataLiberacao == dataLiberacao &&
        other.destino == destino &&
        other.usuarioDcadastro == usuarioDcadastro;
  }

  @override
  int get hashCode {
    return nomePrestador.hashCode ^
        idPrestador.hashCode ^
        nomeEmpresa.hashCode ^
        cpfCnpj.hashCode ^
        tipo.hashCode ^
        dtCadastro.hashCode ^
        pkLiberacao.hashCode ^
        dataLiberacao.hashCode ^
        destino.hashCode ^
        usuarioDcadastro.hashCode;
  }
}
