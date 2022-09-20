import 'package:auto_size_text/auto_size_text.dart';
import 'package:estudo_flutter/features/pages/components/listaIcones.dart';
import 'package:flutter/material.dart';

import '../../carta/carta_model.dart';

class CartaWidget extends StatefulWidget {
  CartaWidget(
      {Key? key,
      required this.carta,
      required this.tamanho,
      this.selecionado = false})
      : super(key: key);

  CartaModel carta;
  double tamanho;
  bool selecionado;

  @override
  State<CartaWidget> createState() => _CartaWidgetState();
}

class _CartaWidgetState extends State<CartaWidget> {
  late Color grad1;
  late Color grad2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.carta.estrelas) {
      case 5:
        grad1 = const Color.fromARGB(255, 255, 193, 7);
        grad2 = const Color.fromARGB(255, 73, 108, 198);
        break;
      case 4:
        grad1 = const Color.fromARGB(255, 116, 27, 185);
        grad2 = const Color.fromARGB(255, 73, 108, 198);
        break;
      case 3:
        grad1 = const Color.fromARGB(255, 73, 108, 198);
        grad2 = const Color.fromARGB(255, 73, 165, 198);
        break;
      case 2:
        grad1 = const Color.fromARGB(255, 73, 108, 198);
        grad2 = const Color.fromARGB(255, 161, 156, 165);
        break;
      default:
        grad1 = const Color.fromARGB(255, 255, 255, 255);
        grad2 = const Color.fromARGB(255, 161, 156, 165);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              alignment: Alignment.topCenter,
              width: 250 * widget.tamanho,
              height: 350 * widget.tamanho,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5 * widget.tamanho,
                      blurRadius: 7 * widget.tamanho,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: const Alignment(0.2, 0.9),
                    stops: const [
                      0.5,
                      1,
                    ],
                    colors: [
                      grad1,
                      grad2,
                    ],
                  ),
                  border: Border.all(
                      color:
                          widget.selecionado ? Colors.lightGreen : Colors.black,
                      width: 3)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(7)),
                            child: Container(
                              width: 250 * widget.tamanho,
                              height: 30 * widget.tamanho,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 246, 233, 184),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 2))),
                            ),
                          ),
                          ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                              child: Image.asset(
                                widget.carta.imagem,
                                width: 210 * widget.tamanho,
                                scale: 0.1,
                              )),
                        ],
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(top: 12 * widget.tamanho),
                                width: 220 * widget.tamanho,
                                height: 30 * widget.tamanho,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Colors.black, width: 2))),
                            Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(top: 10 * widget.tamanho),
                                width: 220 * widget.tamanho,
                                height: 30 * widget.tamanho,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color:
                                      const Color.fromARGB(255, 246, 233, 184),
                                ),
                                child: Stack(
                                  children: [
                                    AutoSizeText(
                                      widget.carta.titulo!,
                                      maxLines: 1,
                                      softWrap: false,
                                      minFontSize: 8,
                                      maxFontSize: 14,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2 * widget.tamanho
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    AutoSizeText(
                                      widget.carta.titulo!,
                                      overflow: TextOverflow.fade,
                                      minFontSize: 8,
                                      maxFontSize: 14,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                Colors.amber[600]!,
                                                Colors.amber[300]!,
                                                Colors.amber[100]!,
                                                Colors.white
                                                //add more color here.
                                              ],
                                            ).createShader(const Rect.fromLTWH(
                                                0.0, 0.0, 300.0, 100.0))),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180 * widget.tamanho,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0 * widget.tamanho),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10 * widget.tamanho,
                                      ),
                                      AutoSizeText(
                                        widget.carta.nome!.toUpperCase(),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        minFontSize: 8,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14 * widget.tamanho,
                                            fontWeight: FontWeight.bold,
                                            shadows: const [
                                              Shadow(
                                                  color: Color.fromARGB(
                                                      100, 0, 0, 0),
                                                  offset: Offset(-1, 2))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 2 * widget.tamanho,
                                      ),
                                      AutoSizeText(widget.carta.serie!,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                          minFontSize: 7,
                                          maxFontSize: 12,
                                          style: TextStyle(
                                            fontSize: 11 * widget.tamanho,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        height: 7 * widget.tamanho,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  endIndent: 5 * widget.tamanho,
                                  indent: 7.5 * widget.tamanho,
                                  color: const Color.fromRGBO(0, 0, 0, .2),
                                  height: 2 * widget.tamanho,
                                  thickness: 2 * widget.tamanho,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 2.5 * widget.tamanho,
                                  ),
                                  height: 42 * widget.tamanho,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.carta.estrelas,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 34 * widget.tamanho,
                                          child: Icon(
                                            Icons.grade,
                                            size: 42 * widget.tamanho,
                                            color: Colors.amber,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  offset: Offset(-2, 2))
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            width: 0,
                            thickness: 5 * widget.tamanho,
                            color: const Color.fromRGBO(0, 0, 0, .1),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(habIcone[widget.carta.icone1!],
                                    size: 33 * widget.tamanho,
                                    color: habCor[widget.carta.icone1!],
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(-1, 2))
                                    ]),
                                SizedBox(height: 5 * widget.tamanho),
                                Icon(habIcone[widget.carta.icone2!],
                                    size: 33 * widget.tamanho,
                                    color: habCor[widget.carta.icone2!],
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(-1, 2))
                                    ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
