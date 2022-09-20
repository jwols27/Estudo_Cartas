import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/usuario_store.dart';
import '../usuario/usuario_controller.dart';
import '../usuario/usuario_model.dart';

class ContaPage extends StatefulWidget {
  ContaPage({Key? key, required this.user}) : super(key: key);

  Usuario user;

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  final List<TextEditingController> _controllers = [];
  final List<String> _campos = ['Nome', 'E-mail', 'Senha', 'Saldo mínimo'];
  String? erroForm;

  UsuarioController _usuarioController = UsuarioController();
  late UsuarioStore _usuarioStore;

  @override
  void didChangeDependencies() {
    _usuarioStore = Provider.of<UsuarioStore>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers.add(TextEditingController());
    _controllers.add(TextEditingController());
    _controllers.add(TextEditingController());
    _controllers.add(TextEditingController());

    _controllers
      ..[0].text = widget.user.nome!
      ..[1].text = widget.user.email!
      ..[2].text = widget.user.senha!
      ..[3].text = '${widget.user.minimo!}';
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Configurações de conta')),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 83, 128, 31).withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage(_usuarioStore.userLog.imagem!),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.separated(
                itemCount: _controllers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _campos[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: _controllers[index],
                            decoration: InputDecoration(
                              errorText: erroForm,
                              suffixIcon: IconButton(
                                onPressed: _controllers[index].clear,
                                icon: const Icon(Icons.cancel_outlined),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            Container(
                width: screenSize.width * 0.70,
                child: ElevatedButton(
                    onPressed: () {
                      if (_controllers.any((element) => element.text == '')) {
                        setState(() {
                          erroForm = 'Você deve preencher todos os campos.';
                        });
                      } else {
                        _usuarioController.atualizarUsuario(
                            _usuarioStore.userLog,
                            _controllers[0].text,
                            _controllers[1].text,
                            _controllers[2].text,
                            _controllers[3].text);
                        setState(() {
                          erroForm = null;
                        });
                      }
                    },
                    child: const Text('Alterar',
                        style: TextStyle(color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}
