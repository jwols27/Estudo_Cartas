import 'dart:convert';

import '../../../sql/entity.dart';

class Usuario extends Entity {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? imagem;
  double? saldo;
  double? minimo;

  Usuario(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.imagem = 'assets/images/hope.png',
      this.saldo = 0,
      this.minimo = 0});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          email == other.email &&
          senha == other.senha &&
          imagem == other.imagem &&
          saldo == other.saldo &&
          minimo == other.minimo);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      senha.hashCode ^
      imagem.hashCode ^
      saldo.hashCode ^
      minimo.hashCode;

  // Convert Class into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'imagem': imagem,
      'saldo': saldo,
      'minimo': minimo,
    };
  }

  // Implement toString to make it easier to see information about
  // each instance when using the print statement.
  @override
  String toString() {
    return 'Usuario{user_id: $id, nome: $nome, email: $email, senha: $senha, imagem: $imagem, saldo: $saldo, minimo: $minimo}';
  }

  Usuario copyWith(
      {int? id,
      String? nome,
      String? email,
      String? senha,
      String? imagem,
      double? saldo,
      double? minimo}) {
    return Usuario(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        senha: senha ?? this.senha,
        imagem: imagem ?? this.imagem,
        saldo: saldo ?? this.saldo,
        minimo: minimo ?? this.minimo);
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        senha: json['senha'],
        imagem: json['imagem'],
        saldo: json['saldo'],
        minimo: json['minimo']);
  }

  String toJson() => json.encode(toMap());
}
