import 'package:avaliacao_2/models/category.dart';
import 'package:avaliacao_2/models/department.dart';
import 'package:avaliacao_2/models/patrimony.dart';
import 'package:avaliacao_2/services/category_service.dart';
import 'package:avaliacao_2/services/department_service.dart';
import 'package:avaliacao_2/services/patrimony_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class RegisterPatrimonyPage extends StatefulWidget {
  final Patrimony? patrimony;

  const RegisterPatrimonyPage({Key? key, this.patrimony}) : super(key: key);

  @override
  State<RegisterPatrimonyPage> createState() => _RegisterPatrimonyPageState();
}

class _RegisterPatrimonyPageState extends State<RegisterPatrimonyPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Department? dropdownValueDepartment;
  List<Category>? categories = [];

  @override
  void initState() {
    if (widget.patrimony != null) {
      nameController.text = widget.patrimony?.name as String;
      priceController.text = widget.patrimony?.price.toString() as String;
      descriptionController.text = widget.patrimony?.description as String;
      dropdownValueDepartment = widget.patrimony?.department;
      categories = widget.patrimony?.categories;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Patrimônios'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 30),
              onPressed: () {
                //se o Patrimônio existir, é para ATUALIZAR
                if (widget.patrimony != null) {
                  widget.patrimony?.name = nameController.text;
                  widget.patrimony?.price = double.parse(priceController.text);
                  widget.patrimony?.description = descriptionController.text;
                  widget.patrimony?.department = dropdownValueDepartment!;
                  widget.patrimony?.categories = categories!;

                  Provider.of<PatrimonyService>(context, listen: false)
                      .updatePatrimony(widget.patrimony!);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Patrimônio atualizado com sucesso!'),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 3,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                }
                //se o Patrimônio NÃO existir, é pra CRIAR
                else {
                  if (categories!.isNotEmpty) {
                    Provider.of<PatrimonyService>(context, listen: false)
                        .addPatrimony(Patrimony(
                      name: nameController.text,
                      department: dropdownValueDepartment!,
                      price: double.parse(priceController.text),
                      description: descriptionController.text,
                      categories: categories!,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Patrimônio cadastrado com sucesso!'),
                        backgroundColor: Colors.green,
                        duration: Duration(
                          seconds: 3,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Selecione pelo menos uma categoria!'),
                        backgroundColor: Colors.red,
                        duration: Duration(
                          seconds: 3,
                        ),
                      ),
                    );
                  }
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
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
                child: Column(children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                    hintText: 'Digite o nome do Patrimônio'),
                keyboardType: TextInputType.text,
              ),
              DropdownButton<Department>(
                value: dropdownValueDepartment,
                items: context
                    .watch<DepartmentService>()
                    .departments
                    .map<DropdownMenuItem<Department>>((Department value) {
                  return DropdownMenuItem<Department>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (Department? newValue) {
                  setState(() {
                    dropdownValueDepartment = newValue!;
                  });
                },
                isExpanded: true,
                elevation: 16,
                icon: const Icon(Icons.arrow_downward),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: priceController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço',
                    hintText: 'Digite o preço'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição',
                    hintText: 'Digite o preço'),
                keyboardType: TextInputType.text,
                maxLength: 150,
                maxLines: 3,
              ),
              const Divider(
                thickness: 2,
              ),
              const Text(
                'Informe as categorias',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                initialValue: categories,
                items: context
                    .watch<CategoryService>()
                    .categories
                    .map((e) => MultiSelectItem(e, e.name))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _categories = values as List<Category>;
                  setState(() {
                    categories = values as List<Category>;
                  });
                },
              ),
            ]))));
  }
}




// class RegisterPatrimonyPage extends StatefulWidget {
//   final Patrimony? patrimony;

//   RegisterPatrimonyPage({
//     Key? key,
//     this.patrimony,
//   }) : super(key: key);
  

//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     if (patrimony != null) {
//       controller.text = patrimony?.name as String;
//     }

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Patrimônios'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.check_circle_outline,
//                   color: Colors.white, size: 30),
//               onPressed: () {
//                 //se o Patrimônio existir, é para ATUALIZAR
//                 if (patrimony != null) {
//                   patrimony?.name = controller.text;
//                   Provider.of<PatrimonyService>(context, listen: false)
//                       .updatePatrimony(patrimony!);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Patrimônio atualizado com sucesso!'),
//                       backgroundColor: Colors.green,
//                       duration: Duration(
//                         seconds: 3,
//                       ),
//                     ),
//                   );
//                   Navigator.pop(context);
//                 }
//                 //se o Patrimônio NÃO existir, é pra CRIAR
//                 else {
//                   Provider.of<PatrimonyService>(context, listen: false)
//                       .addPatrimony(Patrimony(
//                           name: controller.text,
//                           categories: [],
//                           department: Department(
//                             name: 'Patrimônio 1',
//                           ),
//                           description: 'nada',
//                           price: 45));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Patrimônio cadastrado com sucesso!'),
//                       backgroundColor: Colors.green,
//                       duration: Duration(
//                         seconds: 3,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.cancel, color: Colors.white, size: 30),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//         body: Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//             child: SingleChildScrollView(
//                 child: Column(children: [
//               TextField(
//                 controller: controller,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Nome',
//                     hintText: 'Digite o nome do Patrimônio'),
//                 keyboardType: TextInputType.text,
//               ),
//               DropdownButton<Department>(
//                 hint: Text('Selecione o Departamento'),
//               )

//             ]))));
//   }
  
  
// }
