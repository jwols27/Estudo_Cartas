import 'package:sqflite/sqflite.dart';

import '../../sql/db_helper.dart';
import 'carta_model.dart';
import 'carta_dao.dart';
import 'package:flutter/cupertino.dart';

class CartaController {
  Future<Database?> get db => DatabaseHelper.getInstance().db;
  final CartaDao _cartaDao = CartaDao();

  getCartas() async {
    var dbClient = await db;

    try {
      var retorno = await dbClient!.rawQuery('SELECT * FROM carta');

      List<CartaModel> cartas =
          retorno.map((e) => CartaModel.fromJson(e)).toList();

      return cartas;
    } catch (e) {
      print(e);
    }
  }

  getFiltro({String origem = '', carac = '', raridade = ''}) async {
    var dbClient = await db;

    List<String> dbFiltro = [];

    if (origem.isNotEmpty) {
      dbFiltro.add('WHERE serie = "$origem"');
    }
    if (raridade.isNotEmpty) {
      dbFiltro.add(
          "${dbFiltro.isNotEmpty ? ' AND ' : 'WHERE '} estrelas = $raridade");
    }
    if (carac.isNotEmpty) {
      dbFiltro.add(
          "${dbFiltro.isNotEmpty ? ' AND ' : 'WHERE '} (icone1 = $carac OR icone2 = $carac)");
    }

    try {
      var retorno = await dbClient!
          .rawQuery('SELECT * FROM carta ${dbFiltro.join()} LIMIT 9');

      List<CartaModel> cartas =
          retorno.map((e) => CartaModel.fromJson(e)).toList();

      return cartas;
    } catch (e) {
      print(e);
    }
  }

  deletarCarta(BuildContext context, int id) async {
    await _cartaDao.delete(id, "id");
  }

  inserirCarta(BuildContext context, CartaModel value) async {
    await _cartaDao.save(value, '');
    print(CartaModel());
  }
}
