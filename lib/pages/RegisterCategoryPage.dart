import 'package:avaliacao_2/models/category.dart';
import 'package:avaliacao_2/models/category.dart';
import 'package:avaliacao_2/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterCategoryPage extends StatelessWidget {
  final Category? category;

  RegisterCategoryPage({
    Key? key,
    this.category,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (category != null) {
      controller.text = category?.name as String;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('categorias'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 30),
              onPressed: () {
                //se o categoria existir, é para ATUALIZAR
                if (category != null) {
                  category?.name = controller.text;
                  Provider.of<CategoryService>(context, listen: false)
                      .update(category!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('categoria atualizado com sucesso!'),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 3,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                }
                //se o categoria NÃO existir, é pra CRIAR
                else {
                  Provider.of<CategoryService>(context, listen: false)
                      .add(Category(
                    name: controller.text,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('categoria cadastrada com sucesso!'),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 3,
                      ),
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
                hintText: 'Digite o nome da categoria'),
            keyboardType: TextInputType.emailAddress,
          ),
        ));
  }
}
