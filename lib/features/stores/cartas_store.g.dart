// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartasStore on _CartasStore, Store {
  Computed<List<CartaModel>>? _$cartaCarrosselComputed;

  @override
  List<CartaModel> get cartaCarrossel => (_$cartaCarrosselComputed ??=
          Computed<List<CartaModel>>(() => super.cartaCarrossel,
              name: '_CartasStore.cartaCarrossel'))
      .value;
  Computed<List<String>>? _$cartaSeriesComputed;

  @override
  List<String> get cartaSeries =>
      (_$cartaSeriesComputed ??= Computed<List<String>>(() => super.cartaSeries,
              name: '_CartasStore.cartaSeries'))
          .value;
  Computed<List<String>>? _$cartaEstrelasComputed;

  @override
  List<String> get cartaEstrelas => (_$cartaEstrelasComputed ??=
          Computed<List<String>>(() => super.cartaEstrelas,
              name: '_CartasStore.cartaEstrelas'))
      .value;
  Computed<List<String>>? _$cartaIconesComputed;

  @override
  List<String> get cartaIcones =>
      (_$cartaIconesComputed ??= Computed<List<String>>(() => super.cartaIcones,
              name: '_CartasStore.cartaIcones'))
          .value;

  late final _$cartasAtom = Atom(name: '_CartasStore.cartas', context: context);

  @override
  List<CartaModel> get cartas {
    _$cartasAtom.reportRead();
    return super.cartas;
  }

  @override
  set cartas(List<CartaModel> value) {
    _$cartasAtom.reportWrite(value, super.cartas, () {
      super.cartas = value;
    });
  }

  late final _$cartasFiltroAtom =
      Atom(name: '_CartasStore.cartasFiltro', context: context);

  @override
  List<CartaModel> get cartasFiltro {
    _$cartasFiltroAtom.reportRead();
    return super.cartasFiltro;
  }

  @override
  set cartasFiltro(List<CartaModel> value) {
    _$cartasFiltroAtom.reportWrite(value, super.cartasFiltro, () {
      super.cartasFiltro = value;
    });
  }

  late final _$carregamentoAtom =
      Atom(name: '_CartasStore.carregamento', context: context);

  @override
  bool get carregamento {
    _$carregamentoAtom.reportRead();
    return super.carregamento;
  }

  @override
  set carregamento(bool value) {
    _$carregamentoAtom.reportWrite(value, super.carregamento, () {
      super.carregamento = value;
    });
  }

  late final _$carregamentoFAtom =
      Atom(name: '_CartasStore.carregamentoF', context: context);

  @override
  bool get carregamentoF {
    _$carregamentoFAtom.reportRead();
    return super.carregamentoF;
  }

  @override
  set carregamentoF(bool value) {
    _$carregamentoFAtom.reportWrite(value, super.carregamentoF, () {
      super.carregamentoF = value;
    });
  }

  late final _$carregarListaAsyncAction =
      AsyncAction('_CartasStore.carregarLista', context: context);

  @override
  Future carregarLista() {
    return _$carregarListaAsyncAction.run(() => super.carregarLista());
  }

  late final _$carregarFiltroAsyncAction =
      AsyncAction('_CartasStore.carregarFiltro', context: context);

  @override
  Future carregarFiltro(
      {String origem = '', dynamic carac = '', dynamic raridade = ''}) {
    return _$carregarFiltroAsyncAction.run(() =>
        super.carregarFiltro(origem: origem, carac: carac, raridade: raridade));
  }

  @override
  String toString() {
    return '''
cartas: ${cartas},
cartasFiltro: ${cartasFiltro},
carregamento: ${carregamento},
carregamentoF: ${carregamentoF},
cartaCarrossel: ${cartaCarrossel},
cartaSeries: ${cartaSeries},
cartaEstrelas: ${cartaEstrelas},
cartaIcones: ${cartaIcones}
    ''';
  }
}
