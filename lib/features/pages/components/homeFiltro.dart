import 'package:estudo_flutter/features/pages/components/listaIcones.dart';
import 'package:estudo_flutter/features/stores/cartas_store.dart';
import 'package:estudo_flutter/features/stores/tema_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cartaWidget.dart';

class HomeFiltro extends StatefulWidget {
  const HomeFiltro({super.key});

  @override
  State<HomeFiltro> createState() => _HomeFiltroState();
}

class _HomeFiltroState extends State<HomeFiltro> {
  late CartasStore _cartasStore;
  late TemaStore _temaStore;
  String? dropSeries, dropEstrelas, dropIcones;

  int activePageFiltro = 1;
  PageController _pageControllerFiltro = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _temaStore = Provider.of<TemaStore>(context);
    _cartasStore = Provider.of<CartasStore>(context);

    _cartasStore.carregarFiltro();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageControllerFiltro = PageController(viewportFraction: 1, initialPage: 1);
  }

  String origem = '';
  String estrela = '';
  String icone = '';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool telaVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Widget cartaFiltro(int posicao, {bool selected = false}) {
      if (_cartasStore.cartasFiltro.asMap().containsKey(posicao)) {
        return GestureDetector(
            child: CartaWidget(
              carta: _cartasStore.cartasFiltro[posicao],
              tamanho: telaVertical
                  ? screenSize.width * .33 / 250
                  : screenSize.width * .27 / 250,
              selecionado: _cartasStore.cartasSelecionadas
                  .contains(_cartasStore.cartasFiltro[posicao].id),
            ),
            onLongPress: () => setState(() {
                  _cartasStore
                      .selecionarCarta(_cartasStore.cartasFiltro[posicao].id!);
                }));
      } else {
        return Container();
      }
    }

    filtrarTudo() async {
      await _cartasStore.carregarFiltro(
          origem: origem, raridade: estrela, carac: icone);
    }

    return Observer(builder: (context) {
      return SizedBox(
        height: telaVertical
            ? screenSize.width * 0.33 * 1.4 + 60
            : screenSize.width * 0.27 * 1.4 + 60,
        width: screenSize.width,
        child: Container(
          padding: telaVertical
              ? null
              : EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          color: _temaStore.themeString == 'claro'
              ? Color.fromARGB(255, 220, 227, 211)
              : Color.fromARGB(255, 62, 69, 53),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: telaVertical
                        ? screenSize.width * 0.3
                        : screenSize.width * 0.2,
                    height: 35,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: dropSeries,
                      hint: const Text(
                        'Origem',
                        style: TextStyle(fontSize: 12),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropSeries = value;
                          origem = value!;
                          filtrarTudo();
                        });
                      },
                      items: _cartasStore.cartaSeries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.02),
                    width: telaVertical
                        ? screenSize.width * 0.3
                        : screenSize.width * 0.2,
                    height: 35,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: dropIcones,
                      hint: const Text(
                        'Característica',
                        style: TextStyle(fontSize: 12),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropIcones = value ?? '';
                          icone = value!;
                          filtrarTudo();
                        });
                      },
                      items: _cartasStore.cartaIcones
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            habNome[int.tryParse(value)!],
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: telaVertical
                        ? screenSize.width * 0.2
                        : screenSize.width * 0.15,
                    height: 35,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: dropEstrelas,
                      hint: const Text(
                        'Raridade',
                        style: TextStyle(fontSize: 12),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropEstrelas = value ?? '';
                          estrela = value!;
                          filtrarTudo();
                        });
                      },
                      items: _cartasStore.cartaEstrelas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            '$value ★',
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  IconButton(
                      onPressed: (() {
                        setState(() {
                          dropSeries = null;
                          dropEstrelas = null;
                          dropIcones = null;
                          origem = '';
                          estrela = '';
                          icone = '';
                        });
                        _cartasStore.carregarFiltro();
                      }),
                      icon: const Icon(Icons.clear_all))
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              _cartasStore.carregamentoF
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: _cartasStore.cartasFiltro.isNotEmpty
                          ? PageView.builder(
                              padEnds: false,
                              itemCount:
                                  (_cartasStore.cartasFiltro.length / 3).ceil(),
                              pageSnapping: true,
                              controller: _pageControllerFiltro,
                              onPageChanged: (page) {
                                setState(() {
                                  activePageFiltro = page;
                                });
                              },
                              itemBuilder: (context, pagePosition) {
                                return Row(
                                  key: UniqueKey(),
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      child: cartaFiltro(pagePosition * 3),
                                      onLongPress: () => print(_cartasStore
                                          .cartasFiltro[pagePosition * 3]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * 0.005),
                                      child: cartaFiltro(pagePosition * 3 + 1),
                                    ),
                                    GestureDetector(
                                      child: cartaFiltro(pagePosition * 3 + 2),
                                      onLongPress: () => print(_cartasStore
                                          .cartasFiltro[pagePosition * 3 + 2]),
                                    )
                                  ],
                                );
                              })
                          : const Center(
                              child: Text('Nenhum resultado encontrado :('),
                            ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
