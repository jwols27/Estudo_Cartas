import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stores/tema_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TemaStore temaStore;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    temaStore = Provider.of<TemaStore>(context);
    temaStore.setTema();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: context.watch<TemaStore>().currentThemeData,
        home: const LoaderOverlay(child: LoginPage()),
      );
    });
  }
}
