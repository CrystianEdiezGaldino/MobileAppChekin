// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ConvitesModel extends ChangeNotifier {
  String name = '';
  String cpf = '';
  String titulosc = '';
  String datacd = '';
  String datavt = '';
  String local = '';
  String tipocv = '';
  String dcconvite = '';
  String status = '';
  String codconvite = '';
  ConvitesModel({
    required this.name,
    required this.cpf,
    required this.titulosc,
    required this.datacd,
    required this.datavt,
    required this.local,
    required this.tipocv,
    required this.dcconvite,
    required this.status,
    required this.codconvite,
  });

  ConvitesModel copyWith({
    String? name,
    String? cpf,
    String? titulosc,
    String? datacd,
    String? datavt,
    String? local,
    String? tipocv,
    String? dcconvite,
    String? status,
    String? codconvite,
  }) {
    return ConvitesModel(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      titulosc: titulosc ?? this.titulosc,
      datacd: datacd ?? this.datacd,
      datavt: datavt ?? this.datavt,
      local: local ?? this.local,
      tipocv: tipocv ?? this.tipocv,
      dcconvite: dcconvite ?? this.dcconvite,
      status: status ?? this.status,
      codconvite: codconvite ?? this.codconvite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cpf': cpf,
      'titulosc': titulosc,
      'datacd': datacd,
      'datavt': datavt,
      'local': local,
      'tipocv': tipocv,
      'dcconvite': dcconvite,
      'status': status,
      'codconvite': codconvite,
    };
  }

  factory ConvitesModel.fromMap(Map<String, dynamic> map) {
    return ConvitesModel(
      name: map['name'] ?? "",
      cpf: map['cpf'] ?? "",
      titulosc: map['titulosc'] ?? "",
      datacd: map['datacd'] ?? "",
      datavt: map['datavt'] ?? "",
      local: map['local'] ?? "",
      tipocv: map['tipocv'] ?? "",
      dcconvite: map['dcconvite'] ?? "",
      status: map['status'] ?? "",
      codconvite: map['codconvite'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ConvitesModel.fromJson(String source) => ConvitesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ConvitesModel(name: $name, cpf: $cpf, titulosc: $titulosc, datacd: $datacd, datavt: $datavt, local: $local, tipocv: $tipocv, dcconvite: $dcconvite, status: $status, codconvite: $codconvite)';
  }

  @override
  bool operator ==(covariant ConvitesModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.cpf == cpf &&
        other.titulosc == titulosc &&
        other.datacd == datacd &&
        other.datavt == datavt &&
        other.local == local &&
        other.tipocv == tipocv &&
        other.dcconvite == dcconvite &&
        other.status == status &&
        other.codconvite == codconvite;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cpf.hashCode ^
        titulosc.hashCode ^
        datacd.hashCode ^
        datavt.hashCode ^
        local.hashCode ^
        tipocv.hashCode ^
        dcconvite.hashCode ^
        status.hashCode ^
        codconvite.hashCode;
  }
}
