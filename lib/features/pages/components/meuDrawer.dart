import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../usuario/usuario_model.dart';
import '../conta_page.dart';
import '../login_page.dart';
import '../../stores/usuario_store.dart';
import '../../stores/tema_store.dart';

class MeuDrawer extends StatefulWidget {
  const MeuDrawer({Key? key}) : super(key: key);

  @override
  State<MeuDrawer> createState() => _MeuDrawerState();
}

class _MeuDrawerState extends State<MeuDrawer> {
  late TemaStore _temaStore;
  late UsuarioStore _usuarioStore;

  @override
  void didChangeDependencies() {
    _temaStore = Provider.of<TemaStore>(context);
    _usuarioStore = Provider.of<UsuarioStore>(context);
    super.didChangeDependencies();
  }

  deslogar() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  editarConta(Usuario logado) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ContaPage(
                  user: logado,
                )));
  }

  Icon _temaIcone = const Icon(Icons.light_mode);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightGreenAccent.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage(_usuarioStore.userLog.imagem!),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _usuarioStore.userLog.nome!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _usuarioStore.userLog.email!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'R\$${_usuarioStore.userLog.saldo!.toStringAsFixed(2)}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Conta'),
            leading: const Icon(Icons.manage_accounts),
            onTap: () {
              editarConta(_usuarioStore.userLog);
            },
          ),
          ListTile(
            title: Text('Modo ${_temaStore.themeString}'),
            leading: _temaIcone,
            trailing: Switch(
              value: _temaStore.currentThemeType,
              onChanged: (bool value) {
                setState(() {
                  _temaStore.mudarTemaAtual(value);
                  if (value) {
                    _temaIcone = const Icon(Icons.light_mode);
                  } else {
                    _temaIcone = const Icon(Icons.dark_mode);
                  }
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Sobre o app'),
            leading: const Icon(Icons.info),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Informações sobre o app'),
                  content: const Text("""
Criador:  João Pedro Wolschick
Versão:  1.00a

Data da última atualização:
18/08/2022"""),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'ENTENDI');
                      },
                      child: const Text('ENTENDI'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            leading: const Icon(Icons.logout),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                      'Você tem certeza de que quer sair de sua conta?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'SIM');
                        deslogar();
                      },
                      child: const Text('SIM'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'NÃO'),
                      child: const Text('NÃO'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
