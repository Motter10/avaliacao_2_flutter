import 'package:avaliacao_2/models/department.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterDepartmentPage extends StatelessWidget {
  RegisterDepartmentPage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Departamentos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 30),
              onPressed: () {
                Provider.of<DepartmentService>(context, listen: false)
                    .add(Department(
                  name: controller.text,
                ));
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
