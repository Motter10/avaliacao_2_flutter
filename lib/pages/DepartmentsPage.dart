import 'package:avaliacao_2/pages/RegisterDepartmentPage.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departamentos'),
        actions: [
          Visibility(
            visible: _selectedIndex != -1,
            child: IconButton(
              icon:
                  const Icon(Icons.delete_forever, color: Colors.red, size: 30),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Excluir departamento selecionado?'),
                    backgroundColor: Colors.grey,
                    // duration: Duration(
                    //   seconds: 3,
                    // ),
                    action: SnackBarAction(
                      label: 'Excluir',
                      onPressed: () {
                        Provider.of<DepartmentService>(context, listen: false)
                            .removeAt(_selectedIndex);
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
                  builder: (context) => RegisterDepartmentPage(),
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
                  'Departamentos Cadastrados',
                  style: TextStyle(fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      context.watch<DepartmentService>().departments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(context
                            .watch<DepartmentService>()
                            .departments[index]
                            .name),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterDepartmentPage(
                                  department: context
                                      .watch<DepartmentService>()
                                      .departments[index],
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
