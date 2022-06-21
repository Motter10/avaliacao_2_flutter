import 'package:avaliacao_2/models/department.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterDepartmentPage extends StatelessWidget {
  final Department? department;

  RegisterDepartmentPage({
    Key? key,
    this.department,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (department != null) {
      controller.text = department?.name as String;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Departamentos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 30),
              onPressed: () {
                //se o departamento existir, é para ATUALIZAR
                if (department != null) {
                  department?.name = controller.text;
                  Provider.of<DepartmentService>(context, listen: false)
                      .update(department!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Departamento atualizado com sucesso!'),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 3,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                }
                //se o departamento NÃO existir, é pra CRIAR
                else {
                  Provider.of<DepartmentService>(context, listen: false)
                      .add(Department(
                    name: controller.text,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Departamento cadastrado com sucesso!'),
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
                hintText: 'Digite o nome do departamento'),
            keyboardType: TextInputType.emailAddress,
          ),
        ));
  }
}
