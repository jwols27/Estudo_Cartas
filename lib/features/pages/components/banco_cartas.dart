import 'package:estudo_flutter/features/carta/carta_controller.dart';
import 'package:flutter/material.dart';

import '../../carta/carta_model.dart';

class BancoCartas extends StatelessWidget {
  BancoCartas({super.key});

  CartaController _cartaController = CartaController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'carta_btn',
      child: const Icon(Icons.crop_square),
      onPressed: () {
        _cartaController.inserirCarta(
            context,
            CartaModel(
                nome: 'kaedahara Kazuha',
                serie: 'Genshin Impact',
                titulo: 'Folha Escarlate',
                imagem: 'assets/images/CARTA/kazuha.png',
                estrelas: 4,
                icone1: 11,
                icone2: 12));
        _cartaController.inserirCarta(
            context,
            CartaModel(
                nome: 'Niko',
                serie: 'OneShot',
                titulo: 'O Messias',
                imagem: 'assets/images/CARTA/niko.png',
                estrelas: 4,
                icone1: 2,
                icone2: 3));
        _cartaController.inserirCarta(
            context,
            CartaModel(
                nome: 'Reigen Arataka',
                serie: 'Mob Psycho 100',
                titulo: 'O Maior Psíquico do Século 21',
                imagem: 'assets/images/CARTA/reigen.png',
                estrelas: 5,
                icone1: 0,
                icone2: 1));
        _cartaController.inserirCarta(
            context,
            CartaModel(
                nome: 'Collei',
                serie: 'Genshin Impact',
                titulo: 'Broto do Renascimento',
                imagem: 'assets/images/CARTA/collei.png',
                estrelas: 4,
                icone1: 11,
                icone2: 13));
        _cartaController.inserirCarta(
            context,
            CartaModel(
                nome: 'Spike Spiegel',
                serie: 'Cowboy Bebop',
                titulo: 'Fumante Espacial 🎸',
                imagem: 'assets/images/CARTA/spike.png',
                estrelas: 5,
                icone1: 6,
                icone2: 7));
      },
    );
  }
}
