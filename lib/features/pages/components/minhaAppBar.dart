import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../stores/carrinho_store.dart';
import '../../stores/usuario_store.dart';

class MinhaAppBar extends StatefulWidget with PreferredSizeWidget {
  MinhaAppBar({Key? key}) : super(key: key);

  @override
  State<MinhaAppBar> createState() => _MinhaAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MinhaAppBarState extends State<MinhaAppBar> {
  late CarrinhoStore _carrinhoStore;
  late UsuarioStore _usuarioStore;

  @override
  void didChangeDependencies() {
    _carrinhoStore = Provider.of<CarrinhoStore>(context);
    _usuarioStore = Provider.of<UsuarioStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Icon(
        Icons.style_sharp,
        color: Colors.white,
        size: 45,
      ),
      actions: [
        Badge(
          badgeContent:
              Observer(builder: (_) => Text('${_carrinhoStore.value}')),
          badgeColor: Colors.amber,
          position: BadgePosition.bottomEnd(bottom: 4, end: 2),
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
            iconSize: 40,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Builder(
          builder: (context) {
            return TextButton(
              style: TextButton.styleFrom(
                shape: const CircleBorder(),
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(_usuarioStore.userLog.imagem!),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          },
        ),
      ],
    );
  }
}
