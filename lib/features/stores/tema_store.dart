import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:json_theme/json_theme.dart';
import 'package:mobx/mobx.dart';

part 'tema_store.g.dart';

class TemaStore = _TemaStore with _$TemaStore;

abstract class _TemaStore with Store {
  @observable
  bool currentThemeType = true;

  @observable
  ThemeData claro = ThemeData();

  @observable
  ThemeData escuro = ThemeData();

  @action
  setTema() async {
    final claroStr =
        await rootBundle.loadString('assets/appainter_theme_light.json');
    final claroJson = jsonDecode(claroStr);
    final json_claro = ThemeDecoder.decodeThemeData(claroJson)!;

    print(json_claro);

    final escuroStr =
        await rootBundle.loadString('assets/appainter_theme_dark.json');
    final escuroJson = jsonDecode(escuroStr);
    final json_escuro = ThemeDecoder.decodeThemeData(escuroJson)!;

    print(json_escuro);

    claro = json_claro.copyWith(
      appBarTheme: const AppBarTheme(color: Colors.lightGreen),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.lightGreen),
              overlayColor: MaterialStatePropertyAll<Color>(Colors.green))),
    );

    escuro = json_escuro.copyWith(
      primaryColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Colors.lightGreen),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              overlayColor:
                  MaterialStatePropertyAll<Color>(Colors.lightGreen))),
    );
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @action
  void mudarTemaAtual(bool type) {
    currentThemeType = type;
  }

  @computed
  ThemeData get currentThemeData {
    if (currentThemeType) {
      return claro;
    } else {
      return escuro;
    }
  }

  @computed
  String get themeString => (currentThemeType) ? 'claro' : 'escuro';
}
