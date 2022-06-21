import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String title;
  Color color;
  int quantity;
  Function() onTap;

  MyCard({
    Key? key,
    required this.title,
    required this.quantity,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 5,
      child: ListTile(
        onTap: onTap,
        leading: VerticalDivider(
          color: color,
          thickness: 10,
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text("$quantity \n$title cadastrados"),
        isThreeLine: true,
      ),
    );
  }
}
