// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuarioStore on _UsuarioStore, Store {
  late final _$userLogAtom =
      Atom(name: '_UsuarioStore.userLog', context: context);

  @override
  Usuario get userLog {
    _$userLogAtom.reportRead();
    return super.userLog;
  }

  @override
  set userLog(Usuario value) {
    _$userLogAtom.reportWrite(value, super.userLog, () {
      super.userLog = value;
    });
  }

  late final _$_UsuarioStoreActionController =
      ActionController(name: '_UsuarioStore', context: context);

  @override
  void logar(Usuario logado) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.logar');
    try {
      return super.logar(logado);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userLog: ${userLog}
    ''';
  }
}
