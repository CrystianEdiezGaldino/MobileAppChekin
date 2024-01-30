// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum ConfigModelStatus {
  negado(0),
  liberado(1),
  error(2);

  final int value;
  const ConfigModelStatus(this.value);
  factory ConfigModelStatus.fromValue(int value) {
    if (value == 0) return ConfigModelStatus.negado;
    if (value == 1) return ConfigModelStatus.liberado;
    if (value == 2) return ConfigModelStatus.error;
    throw Exception("O valor informador $value não é permitido , os valores permitidos é  0,1 e 2");
  }
}

class ConfigModel {
  final String nome;
  final String local;
  final ConfigModelStatus status;

  ConfigModel({
    required this.nome,
    required this.local,
    required this.status,
  });

  ConfigModel copyWith({
    String? nome,
    String? local,
    ConfigModelStatus? status,
  }) {
    return ConfigModel(
      nome: nome ?? this.nome,
      local: local ?? this.local,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'local': local,
      'status': status.value,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      nome: map['nome'] ?? "",
      local: map['local'] ?? "",
      status: ConfigModelStatus.fromValue((map['status']) ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) => ConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConfigModel(nome: $nome, local: $local, status: $status)';

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.local == local && other.status == status;
  }

  @override
  int get hashCode => nome.hashCode ^ local.hashCode ^ status.hashCode;
}
