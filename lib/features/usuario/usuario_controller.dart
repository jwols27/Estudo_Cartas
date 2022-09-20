import 'package:sqflite/sqflite.dart';

import '../../sql/db_helper.dart';
import 'usuario_model.dart';
import 'usuario_dao.dart';
import 'package:flutter/cupertino.dart';

class UsuarioController {
  Future<Database?> get db => DatabaseHelper.getInstance().db;
  final UsuarioDao _usuarioDao = UsuarioDao();

  getUsuarios(BuildContext context) async {
    var dbClient = await db;

    try {
      var retorno = await dbClient!.rawQuery('SELECT * FROM usuario');

      List<Usuario> users = retorno.map((e) => Usuario.fromJson(e)).toList();

      return users;
    } catch (e) {
      print(e);
    }
  }

  deletarUsuario(BuildContext context, int id) async {
    await _usuarioDao.delete(id, "id");
  }

  inserirUsuario(BuildContext context, Usuario value) async {
    await _usuarioDao.save(value, '');
  }

  atualizarCampo(BuildContext context, int numId, String coluna, String novo) {
    _usuarioDao.update(numId, coluna, novo);
  }

  // Atualiza tanto a instância quanto o banco
  Future<List<Usuario>> atualizarUsuario(Usuario user, String nome,
      String email, String senha, String minimo) async {
    user
      ..nome = nome
      ..email = email
      ..senha = senha
      ..minimo = double.parse(minimo);
    return await _usuarioDao.query(
        'UPDATE usuario SET nome = ?, email = ?, senha = ?, minimo = ? WHERE id = ?;',
        [nome, email, senha, double.parse(minimo), user.id]);
  }

  Future<List<Usuario>> confirmarLogin(
      BuildContext context, String email, String senha) async {
    return await _usuarioDao.query(
        'SELECT * FROM usuario WHERE email = ? AND senha = ?', [email, senha]);
  }
}
