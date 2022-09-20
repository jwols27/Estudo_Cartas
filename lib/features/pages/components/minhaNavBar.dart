import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../busca_page.dart';
import '../colecao_page.dart';
import '../home_page.dart';

class MinhaNavBar extends StatefulWidget {
  MinhaNavBar({Key? key, required int this.indiceExterno}) : super(key: key);

  int indiceExterno;

  @override
  State<MinhaNavBar> createState() => _MinhaNavBarState();
}

class _MinhaNavBarState extends State<MinhaNavBar> {
  navPaginas(int indice) {
    switch (indice) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ColecaoPage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MyHomePage()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => BuscaPage()));
        break;
    }
  }

  Icon iconeTab(IconData nomeIcone, bool pagina) {
    if (pagina) {
      return Icon(nomeIcone, color: Colors.white, size: 37.5);
    } else {
      return Icon(
        nomeIcone,
        color: const Color.fromARGB(255, 79, 126, 23),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool telaVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return ConvexAppBar(
      style: TabStyle.reactCircle,
      height:
          telaVertical ? screenSize.height * 0.1 : screenSize.height * 0.125,
      curveSize: 100,
      color: const Color.fromARGB(255, 79, 126, 23),
      activeColor: const Color.fromARGB(255, 79, 126, 23),
      backgroundColor: const Color.fromARGB(255, 183, 231, 127),
      items: [
        TabItem(
            title: 'Coleção',
            icon: iconeTab(
                Icons.collections_bookmark_sharp, widget.indiceExterno == 0)),
        TabItem(
            title: 'Início',
            icon: iconeTab(Icons.home_sharp, widget.indiceExterno == 1)),
        TabItem(
            title: 'Buscar',
            icon:
                iconeTab(Icons.manage_search_sharp, widget.indiceExterno == 2)),
      ],
      initialActiveIndex: widget.indiceExterno,
      onTap: (int i) {
        if (i != widget.indiceExterno) {
          navPaginas(i);
        }
        print('click index=$i');
      },
    );
  }
}
