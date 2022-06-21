import 'package:avaliacao_2/pages/RegisterCategoryPage.dart';
import 'package:avaliacao_2/pages/RegisterCategoryPage.dart';
import 'package:avaliacao_2/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        actions: [
          Visibility(
            visible: _selectedIndex != -1,
            child: IconButton(
              icon:
                  const Icon(Icons.delete_forever, color: Colors.red, size: 30),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Excluir categoria selecionada?'),
                    backgroundColor: Colors.grey,
                    // duration: Duration(
                    //   seconds: 3,
                    // ),
                    action: SnackBarAction(
                      label: 'Excluir',
                      onPressed: () {
                        Provider.of<CategoryService>(context, listen: false)
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
                  builder: (context) => RegisterCategoryPage(),
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
                  'categorias cadastradas',
                  style: TextStyle(fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: context.watch<CategoryService>().categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(context
                            .watch<CategoryService>()
                            .categories[index]
                            .name),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterCategoryPage(
                                  category: context
                                      .watch<CategoryService>()
                                      .categories[index],
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
