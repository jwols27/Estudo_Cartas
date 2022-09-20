import 'dart:convert';

import '../../../sql/entity.dart';

class CartaModel extends Entity {
  int? id;
  String? nome;
  String? serie;
  String? titulo;
  String imagem;
  int? estrelas;
  int? icone1;
  int? icone2;

  CartaModel(
      {this.id,
      this.nome,
      this.serie,
      this.titulo,
      this.imagem = 'assets/images/reigen.png',
      this.estrelas = 1,
      this.icone1 = 0,
      this.icone2 = 1});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartaModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          serie == other.serie &&
          titulo == other.titulo &&
          imagem == other.imagem &&
          estrelas == other.estrelas &&
          icone1 == other.icone1 &&
          icone2 == other.icone2);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      serie.hashCode ^
      titulo.hashCode ^
      imagem.hashCode ^
      estrelas.hashCode ^
      icone1.hashCode ^
      icone2.hashCode;

  // Convert Class into a Map. The keys must correspond to the names of the
  // columns in the database.
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'serie': serie,
      'titulo': titulo,
      'imagem': imagem,
      'estrelas': estrelas,
      'icone1': icone1,
      'icone2': icone2
    };
  }

  // Implement toString to make it easier to see information about
  // each instance when using the print statement.
  @override
  String toString() {
    return 'Carta{user_id: $id, nome: $nome, serie: $serie, titulo: $titulo, imagem: $imagem, estrelas: $estrelas, icone1: $icone1, icone2: $icone2}';
  }

  CartaModel copyWith({
    int? id,
    String? nome,
    String? serie,
    String? titulo,
    String? imagem,
    int? estrelas,
    int? icone1,
    int? icone2,
  }) {
    return CartaModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        serie: serie ?? this.serie,
        titulo: titulo ?? this.titulo,
        imagem: imagem ?? this.imagem,
        estrelas: estrelas ?? this.estrelas,
        icone1: icone1 ?? this.icone1,
        icone2: icone2 ?? this.icone2);
  }

  factory CartaModel.fromJson(Map<String, dynamic> json) {
    return CartaModel(
        id: json['id'],
        nome: json['nome'],
        serie: json['serie'],
        titulo: json['titulo'],
        imagem: json['imagem'],
        estrelas: json['estrelas'],
        icone1: json['icone1'],
        icone2: json['icone2']);
  }

  String toJson() => json.encode(toMap());
}
