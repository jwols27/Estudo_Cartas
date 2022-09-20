import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'features/app.dart';
import 'features/stores/carrinho_store.dart';
import 'features/stores/cartas_store.dart';
import 'features/stores/usuario_store.dart';
import 'features/stores/tema_store.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => CarrinhoStore()),
      Provider(create: (_) => TemaStore()),
      Provider(create: (_) => UsuarioStore()),
      Provider(create: (_) => CartasStore()),
    ],
    child: MyApp(),
  ));
}
