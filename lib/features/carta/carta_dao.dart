import 'carta_model.dart';

import '../../../sql/base_dao.dart';

class CartaDao extends BaseDao<CartaModel> {
  @override
  CartaModel fromMap(Map<String, dynamic> map) {
    return CartaModel.fromJson(map);
  }

  @override
  String get tableName => "carta";

  getCartas() async {
    try {
      List<CartaModel> cartas = await query('SELECT * FROM carta');

      return cartas;
    } catch (e) {
      print(e);
    }
  }
}
