import 'usuario_model.dart';

import '../../../sql/base_dao.dart';

class UsuarioDao extends BaseDao<Usuario> {
  @override
  Usuario fromMap(Map<String, dynamic> map) {
    return Usuario.fromJson(map);
  }

  @override
  String get tableName => "usuario";
}
