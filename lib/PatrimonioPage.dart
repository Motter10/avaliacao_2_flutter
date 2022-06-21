import 'package:flutter/material.dart';

import 'components/MyCard.dart';

class PatrimonioPage extends StatefulWidget {
  const PatrimonioPage({Key? key}) : super(key: key);

  @override
  _PatrimonioPageState createState() => _PatrimonioPageState();
}

class _PatrimonioPageState extends State<PatrimonioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Patrimônio'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const Divider(
                color: Colors.blue,
              ),
              MyCard(
                title: 'Departamentos',
                quantity: 10,
                color: Colors.blue,
              ),
              MyCard(
                title: 'Categorias',
                quantity: 5,
                color: Colors.green,
              ),
              MyCard(
                title: 'Patrimônios',
                quantity: 50,
                color: Colors.orange,
              ),
            ]),
          ),
        ));
  }
}
