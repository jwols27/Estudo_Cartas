import 'package:estudo_flutter/features/carta/carta_controller.dart';
import 'package:estudo_flutter/features/pages/components/banco_cartas.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../stores/usuario_store.dart';
import '../usuario/usuario_controller.dart';
import '../usuario/usuario_model.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerTextUsuario = TextEditingController();
  final controllerTextSenha = TextEditingController();
  String? erroForm;

  UsuarioController _usuarioController = UsuarioController();
  CartaController _cartaController = CartaController();

  late UsuarioStore _usuarioStore;

  @override
  void didChangeDependencies() {
    _usuarioStore = Provider.of<UsuarioStore>(context);
    super.didChangeDependencies();
  }

  logarDep() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ScrollController scrollController = ScrollController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40.0),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreen,
                  ),
                  child: const Icon(
                    Icons.style_sharp,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                width: screenWidth * 0.80,
                child: TextField(
                  controller: controllerTextUsuario,
                  decoration: InputDecoration(
                    errorText: erroForm,
                    border: const OutlineInputBorder(),
                    labelText: 'Usuário',
                    suffixIcon: IconButton(
                      onPressed: controllerTextUsuario.clear,
                      icon: const Icon(Icons.cancel_outlined),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.80,
                margin: const EdgeInsets.only(bottom: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: controllerTextSenha,
                  decoration: InputDecoration(
                    errorText: erroForm,
                    border: const OutlineInputBorder(),
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      onPressed: controllerTextSenha.clear,
                      icon: const Icon(Icons.cancel_outlined),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 50.0),
                  width: screenWidth * 0.70,
                  child: ElevatedButton(
                      onPressed: () async {
                        context.loaderOverlay.show();

                        List<Usuario> usuario =
                            await _usuarioController.confirmarLogin(
                                context,
                                controllerTextUsuario.text,
                                controllerTextSenha.text);
                        if (usuario.isNotEmpty) {
                          debugPrint('Funciona');
                          setState(() {
                            erroForm = null;
                          });

                          _usuarioStore.logar(usuario.first);
                          logarDep();
                        } else {
                          context.loaderOverlay.hide();
                          setState(() {
                            erroForm =
                                'Usuário ou senha incorretos, tente novamente.';
                          });
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BancoCartas(),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: 'user_btn',
            child: const Icon(Icons.person),
            onPressed: () {
              _usuarioController.inserirUsuario(
                  context,
                  Usuario(
                      nome: 'wo',
                      email: 'wo@',
                      senha: '123',
                      imagem: 'assets/images/niko_huh.png'));
            },
          ),
        ],
      ),
    );
  }
}
