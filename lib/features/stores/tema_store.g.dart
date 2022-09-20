// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tema_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemaStore on _TemaStore, Store {
  Computed<ThemeData>? _$currentThemeDataComputed;

  @override
  ThemeData get currentThemeData => (_$currentThemeDataComputed ??=
          Computed<ThemeData>(() => super.currentThemeData,
              name: '_TemaStore.currentThemeData'))
      .value;
  Computed<String>? _$themeStringComputed;

  @override
  String get themeString =>
      (_$themeStringComputed ??= Computed<String>(() => super.themeString,
              name: '_TemaStore.themeString'))
          .value;

  late final _$currentThemeTypeAtom =
      Atom(name: '_TemaStore.currentThemeType', context: context);

  @override
  bool get currentThemeType {
    _$currentThemeTypeAtom.reportRead();
    return super.currentThemeType;
  }

  @override
  set currentThemeType(bool value) {
    _$currentThemeTypeAtom.reportWrite(value, super.currentThemeType, () {
      super.currentThemeType = value;
    });
  }

  late final _$claroAtom = Atom(name: '_TemaStore.claro', context: context);

  @override
  ThemeData get claro {
    _$claroAtom.reportRead();
    return super.claro;
  }

  @override
  set claro(ThemeData value) {
    _$claroAtom.reportWrite(value, super.claro, () {
      super.claro = value;
    });
  }

  late final _$escuroAtom = Atom(name: '_TemaStore.escuro', context: context);

  @override
  ThemeData get escuro {
    _$escuroAtom.reportRead();
    return super.escuro;
  }

  @override
  set escuro(ThemeData value) {
    _$escuroAtom.reportWrite(value, super.escuro, () {
      super.escuro = value;
    });
  }

  late final _$setTemaAsyncAction =
      AsyncAction('_TemaStore.setTema', context: context);

  @override
  Future setTema() {
    return _$setTemaAsyncAction.run(() => super.setTema());
  }

  late final _$_TemaStoreActionController =
      ActionController(name: '_TemaStore', context: context);

  @override
  void mudarTemaAtual(bool type) {
    final _$actionInfo = _$_TemaStoreActionController.startAction(
        name: '_TemaStore.mudarTemaAtual');
    try {
      return super.mudarTemaAtual(type);
    } finally {
      _$_TemaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentThemeType: ${currentThemeType},
claro: ${claro},
escuro: ${escuro},
currentThemeData: ${currentThemeData},
themeString: ${themeString}
    ''';
  }
}
