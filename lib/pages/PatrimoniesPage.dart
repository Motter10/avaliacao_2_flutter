import 'package:avaliacao_2/pages/RegisterPatrimonyPage.dart';
import 'package:avaliacao_2/services/patrimony_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatrimoniesPage extends StatefulWidget {
  const PatrimoniesPage({Key? key}) : super(key: key);

  @override
  State<PatrimoniesPage> createState() => _PatrimoniesPageState();
}

class _PatrimoniesPageState extends State<PatrimoniesPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patrimônios'),
        actions: [
          Visibility(
            visible: _selectedIndex != -1,
            child: IconButton(
              icon:
                  const Icon(Icons.delete_forever, color: Colors.red, size: 30),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Excluir patrimônio selecionado?'),
                    backgroundColor: Colors.grey,
                    // duration: Duration(
                    //   seconds: 3,
                    // ),
                    action: SnackBarAction(
                      label: 'Excluir',
                      onPressed: () {
                        Provider.of<PatrimonyService>(context, listen: false)
                            .removePatrimonyAt(_selectedIndex);
                        setState(() {
                          _selectedIndex = -1;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPatrimonyPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Patrimônios Cadastrados',
                  style: TextStyle(fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      context.watch<PatrimonyService>().patrimonies.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(context
                            .watch<PatrimonyService>()
                            .patrimonies[index]
                            .name),
                        subtitle: Text(context
                            .watch<PatrimonyService>()
                            .patrimonies[index]
                            .department
                            .name),
                        trailing: Text(
                            'Preço: R\$${context.watch<PatrimonyService>().patrimonies[index].price}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPatrimonyPage(
                                  patrimony: context
                                      .watch<PatrimonyService>()
                                      .patrimonies[index],
                                ),
                              ));
                        },
                        selected: _selectedIndex == index,
                        selectedTileColor: Colors.grey.shade200,
                        onLongPress: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
