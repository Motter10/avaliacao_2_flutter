import 'package:avaliacao_2/pages/RegisterDepartmentPage.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departamentos'),
        actions: [
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
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: DepartmentService().departments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(DepartmentService().departments[index].name),
              );
            },
          ),
        ),
      ),
    );
  }
}
