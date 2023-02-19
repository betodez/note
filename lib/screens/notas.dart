import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controllers/nota_controller.dart';
import 'package:note_app/widgets/textfield_custom.dart';

import '../blocs/user/user_bloc.dart';
import '../widgets/item_nota.dart';

class Notas extends StatelessWidget {
  const Notas({super.key});

  @override
  Widget build(BuildContext context) {
    NotaController controller = NotaController(context: context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hola ${state.fullName}'),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                tooltip: 'Salir',
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'login');
                },
              ),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              TextFieldCustom(
                icon: Icons.note,
                fn: (value) {
                  controller.addContenido(value ?? '');
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: state.contenido.trim().isNotEmpty
                      ? () => controller.addNote()
                      : null,
                  child: const Text('Agregar nota')),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.lstNotas.length,
                  itemBuilder: (context, index) => ItemNota(
                    nota: state.lstNotas[index],
                    fn: (index) {},
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
