import 'package:flutter/material.dart';

import 'components/minhaNavBar.dart';

class ColecaoPage extends StatefulWidget {
  const ColecaoPage({Key? key}) : super(key: key);

  @override
  State<ColecaoPage> createState() => _ColecaoPageState();
}

class _ColecaoPageState extends State<ColecaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: MinhaNavBar(indiceExterno: 0),
      body: Container(
        child: const Text(
          'ColecaoPage',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
