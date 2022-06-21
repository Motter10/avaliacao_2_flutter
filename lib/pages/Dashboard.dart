import 'package:avaliacao_2/pages/DepartmentsPage.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:flutter/material.dart';

import '../components/MyCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                quantity: DepartmentService().departments.length,
                color: Colors.blue,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DepartmentsPage()));
                },
              ),
              MyCard(
                title: 'Categorias',
                quantity: 5,
                color: Colors.green,
                onTap: () {
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              MyCard(
                title: 'Patrimônios',
                quantity: 50,
                color: Colors.orange,
                onTap: () {
                  Navigator.pushNamed(context, '/patrimonies');
                },
              ),
            ]),
          ),
        ));
  }
}