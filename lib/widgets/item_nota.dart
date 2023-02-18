import 'package:flutter/material.dart';

import '../models/nota.dart';

class ItemNota extends StatelessWidget {
  final Nota nota;

  final Function(int id) fn;

  const ItemNota({super.key, required this.nota, required this.fn});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direccion) => fn(nota.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color.fromRGBO(0, 140, 35, 0.5),
        child: ListTile(
          title: Text(nota.text),
        ),
      ),
    );
  }
}
