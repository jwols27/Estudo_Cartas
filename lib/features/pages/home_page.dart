import 'package:estudo_flutter/features/pages/components/homeCarrossel.dart';
import 'package:estudo_flutter/features/pages/components/homeFiltro.dart';
import 'package:estudo_flutter/features/pages/components/minhaNavBar.dart';
import 'package:estudo_flutter/features/stores/cartas_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../stores/carrinho_store.dart';
import 'components/minhaAppBar.dart';
import 'components/meuDrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late CarrinhoStore _carrinhoStore;
  late CartasStore _cartasStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartasStore = Provider.of<CartasStore>(context);
    _cartasStore.carregarLista();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool telaVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Observer(builder: (context) {
      return Scaffold(
        appBar: MinhaAppBar(),
        endDrawer: const MeuDrawer(),
        bottomNavigationBar: MinhaNavBar(indiceExterno: 1),
        body: _cartasStore.carregamento
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                children: [
                  HomeCarrossel(),
                  const Divider(),
                  HomeFiltro(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: telaVertical
                            ? EdgeInsets.only(right: screenSize.height * 0.01)
                            : EdgeInsets.only(right: screenSize.height * 0.10),
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () => print(''),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                          child: const Text('Comprar',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: telaVertical
                        ? EdgeInsets.only(right: screenSize.height * 0.01)
                        : EdgeInsets.only(right: screenSize.height * 0.10),
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () => print('Comprar'),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                      ),
                      child: const Text('Comprar',
                          style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              )),
      );
    });
  }
}



/*FutureBuilder(
          future: _usuarioController.getUsuarios(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                context.loaderOverlay.show();
                return Container();
              case ConnectionState.active:
                return Container();
              case ConnectionState.done:
                context.loaderOverlay.hide();
                List<Usuario> usuarios = snapshot.data;
                return ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 24),
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              usuarios[index].nome!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usuarios[index].email!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(usuarios[index].senha!),
                                  const SizedBox(height: 4),
                                  Image.asset(
                                    usuarios[index].imagem ?? '',
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                            trailing:
                                _usuarioStore.userLog.id != usuarios[index].id
                                    ? IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () => setState(() {
                                          _usuarioController.deletarUsuario(
                                              context, usuarios[index].id!);
                                        }),
                                      )
                                    : null,
                          ),
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),*/
