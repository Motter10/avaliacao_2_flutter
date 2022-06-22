import 'package:avaliacao_2/pages/CategoriesPage.dart';
import 'package:avaliacao_2/pages/DepartmentsPage.dart';
import 'package:avaliacao_2/pages/PatrimoniesPage.dart';
import 'package:avaliacao_2/services/category_service.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:avaliacao_2/services/patrimony_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                quantity: context.watch<DepartmentService>().departments.length,
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
                quantity: context.watch<CategoryService>().categories.length,
                color: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoriesPage()));
                },
              ),
              MyCard(
                title: 'Patrimônios',
                quantity: context.watch<PatrimonyService>().patrimonies.length,
                color: Colors.orange,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PatrimoniesPage()));
                },
              ),
            ]),
          ),
        ));
  }
}
