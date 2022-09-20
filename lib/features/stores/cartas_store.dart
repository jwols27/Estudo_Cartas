import 'package:estudo_flutter/features/carta/carta_controller.dart';
import 'package:estudo_flutter/features/carta/carta_dao.dart';
import 'package:mobx/mobx.dart';

import '../carta/carta_model.dart';

// Include generated file
part 'cartas_store.g.dart';

// This is the class used by rest of your codebase
class CartasStore = _CartasStore with _$CartasStore;

// The store-class
abstract class _CartasStore with Store {
  final CartaDao _cartaDao = CartaDao();
  CartaController _cartaController = CartaController();

  @observable
  List<CartaModel> cartas = [];

  @observable
  List<CartaModel> cartasFiltro = [];

  @observable
  List<int> cartasSelecionadas = [];

  @observable
  bool carregamento = false;

  @observable
  bool carregamentoF = false;

  @action
  selecionarCarta(int carta) async {
    if (cartasSelecionadas.contains(carta)) {
      cartasSelecionadas.remove(carta);
    } else {
      cartasSelecionadas.add(carta);
    }
    print(cartasSelecionadas);
  }

  @action
  carregarLista() async {
    carregamento = true;
    cartas = await _cartaDao.getCartas();
    carregamento = false;
  }

  @action
  carregarFiltro({String origem = '', carac = '', raridade = ''}) async {
    carregamentoF = true;
    cartasFiltro = await _cartaController.getFiltro(
        origem: origem, carac: carac, raridade: raridade);
    carregamentoF = false;
  }

  @computed
  List<CartaModel> get cartaCarrossel {
    List<CartaModel> list = [];
    list
      ..add(cartas[0])
      ..add(cartas[1])
      ..add(cartas[2]);
    return list;
  }

  @computed
  List<String> get cartaSeries {
    var list = cartas
        .map((item) {
          return item.serie!;
        })
        .toSet()
        .toList();

    list.sort();
    return list;
  }

  @computed
  List<String> get cartaEstrelas {
    var list = cartas
        .map((item) {
          return item.estrelas!.toString();
        })
        .toSet()
        .toList();

    list.sort();
    return list;
  }

  @computed
  List<String> get cartaIcones {
    List<int> list = cartas.map((item) {
      return item.icone1!;
    }).toList();

    list.addAll(cartas.map((item) {
      return item.icone2!;
    }).toList());

    list.sort();

    List<String> list2 = list.map((item) {
      return item.toString();
    }).toList();

    return list2.toSet().toList();
  }
}
