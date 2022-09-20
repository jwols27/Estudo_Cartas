import 'package:estudo_flutter/features/carta/carta_controller.dart';
import 'package:estudo_flutter/features/carta/carta_model.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'components/cartaWidget.dart';
import 'components/minhaNavBar.dart';

class BuscaPage extends StatefulWidget {
  const BuscaPage({Key? key}) : super(key: key);

  @override
  State<BuscaPage> createState() => _BuscaPageState();
}

CartaController _cartaController = CartaController();

class _BuscaPageState extends State<BuscaPage> {
  @override
  Widget build(BuildContext context) {
    var tamanho = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: MinhaNavBar(indiceExterno: 2),
      body: SizedBox(
        width: tamanho.width * .98,
        height: 2000,
        child: FutureBuilder(
          future: _cartaController.getCartas(),
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
                List<CartaModel> cartas = snapshot.data;
                return ListView.builder(
                  itemCount: cartas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 24),
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 5,
                          child: CartaWidget(
                            carta: cartas[index],
                            tamanho: tamanho.width * .5 / 250,
                          ),
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

/*
CartaWidget(
              carta: _cartaModel,
              tamanho: tamanho.width * .5 / 250,
            ),
*/
