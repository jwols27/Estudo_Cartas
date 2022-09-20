import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';
import 'entity.dart';

// Data Access Object
abstract class BaseDao<T extends Entity> {
  Future<Database?> get db => DatabaseHelper.getInstance().db;

  String get tableName;

  T fromMap(Map<String, dynamic> map);

  Future<int> save(T entity, String s) async {
    var dbClient = await db;
    var id = await dbClient!.insert(tableName, entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<T>> update(int numId, String coluna, String novo) async {
    var dbClient = await db;
    final list = await dbClient!.rawQuery(
        'UPDATE $tableName SET $coluna = ? WHERE id = ?;', [novo, numId]);
    return list.map<T>((json) => fromMap(json)).toList();
  }

  Future<List<T>> query(String sql, [List<dynamic>? arguments]) async {
    final dbClient = await db;

    final list = await dbClient!.rawQuery(sql, arguments);

    return list.map<T>((json) => fromMap(json)).toList();
  }

  Future<List<T>> findAll() {
    return query('select * from $tableName');
  }

  Future<T?> findById(int id) async {
    List<T> list = await query('select * from $tableName where id = ?', [id]);

    return list.isNotEmpty ? list.first : null;
  }

  Future<bool> exists(int id) async {
    T? c = await findById(id);
    var exists = c != null;
    return exists;
  }

  Future<int?> count() async {
    final dbClient = await db;
    final list = await dbClient!.rawQuery('select count(*) from $tableName');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id, String campo) async {
    var dbClient = await db;
    return await dbClient!
        .rawDelete('delete from $tableName where $campo = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient!.rawDelete('delete from $tableName');
  }
}
