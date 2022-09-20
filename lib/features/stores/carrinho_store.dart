import 'package:mobx/mobx.dart';

// Include generated file
part 'carrinho_store.g.dart';

// This is the class used by rest of your codebase
class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

// The store-class
abstract class _CarrinhoStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
