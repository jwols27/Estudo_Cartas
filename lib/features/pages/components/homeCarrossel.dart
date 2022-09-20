import 'package:estudo_flutter/features/stores/tema_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../carta/carta_model.dart';
import '../../stores/cartas_store.dart';
import 'cartaWidget.dart';

class HomeCarrossel extends StatefulWidget {
  const HomeCarrossel({super.key});

  @override
  State<HomeCarrossel> createState() => _HomeCarrosselState();
}

class _HomeCarrosselState extends State<HomeCarrossel> {
  PageController _pageController = PageController();

  late CartasStore _cartasStore;
  late TemaStore _temaStore;
  int activePage = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _temaStore = Provider.of<TemaStore>(context);
    _cartasStore = Provider.of<CartasStore>(context);
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
            color: _temaStore.themeString == 'claro'
                ? currentIndex == index
                    ? Colors.black
                    : Colors.black26
                : currentIndex == index
                    ? Colors.white
                    : Colors.white24,
            //currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool telaVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;
    _pageController = PageController(
        viewportFraction: telaVertical ? 1 : 0.4, initialPage: 1);
    return Column(
      children: [
        SizedBox(
            height: telaVertical
                ? screenSize.height * 0.40
                : screenSize.height * 0.63,
            child: PageView.builder(
              itemCount: _cartasStore.cartaCarrossel.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: AnimatedOpacity(
                        opacity: pagePosition == activePage ? 1 : 0,
                        duration: const Duration(milliseconds: 100),
                        child: Container(
                          margin: const EdgeInsets.only(left: 150),
                          width: telaVertical
                              ? screenSize.width * 0.4
                              : screenSize.width * 0.22,
                          height: telaVertical
                              ? screenSize.width * 0.48 * 1.4
                              : screenSize.width * 0.2 * 1.4,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      child: CartaWidget(
                        carta: _cartasStore.cartaCarrossel[pagePosition],
                        tamanho: telaVertical
                            ? screenSize.width * .5 / 250
                            : screenSize.width * .22 / 250,
                      ),
                    )
                  ],
                );
              },
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                indicators(_cartasStore.cartaCarrossel.length, activePage)),
      ],
    );
  }
}
