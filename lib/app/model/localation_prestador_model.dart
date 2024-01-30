// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class PrestadorModel extends ChangeNotifier {
  String? iddestino;
  String? descricao;

  @override
  notifyListeners();

  PrestadorModel({
    this.iddestino,
    this.descricao,
  });

  PrestadorModel copyWith({
    String? iddestino,
    String? descricao,
  }) {
    return PrestadorModel(
      iddestino: iddestino ?? this.iddestino,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_destino': iddestino,
      'descricao': descricao,
    };
  }

  factory PrestadorModel.fromMap(Map<String, dynamic> map) {
    return PrestadorModel(
      iddestino: map['id_destino'] != null ? map['id_destino'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrestadorModel.fromJson(String source) => PrestadorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PrestadorModel(id_destino: $iddestino, descricao: $descricao)';

  @override
  bool operator ==(covariant PrestadorModel other) {
    if (identical(this, other)) return true;

    return other.iddestino == iddestino && other.descricao == descricao;
  }

  @override
  int get hashCode => iddestino.hashCode ^ descricao.hashCode;
}
