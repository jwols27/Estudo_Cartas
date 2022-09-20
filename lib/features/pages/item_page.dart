import 'package:flutter/material.dart';

import 'components/minhaNavBar.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: MinhaNavBar(indiceExterno: 1),
      body: Container(
        child: const Text(
          'ItemPage',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
