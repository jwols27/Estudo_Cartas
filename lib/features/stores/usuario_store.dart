import 'package:mobx/mobx.dart';

import '../usuario/usuario_model.dart';

// Include generated file
part 'usuario_store.g.dart';

// This is the class used by rest of your codebase
class UsuarioStore = _UsuarioStore with _$UsuarioStore;

// The store-class
abstract class _UsuarioStore with Store {
  @observable
  Usuario userLog = Usuario();

  @action
  void logar(Usuario logado) {
    userLog = logado;
  }
}
