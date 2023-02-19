import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/nota.dart';
import 'package:note_app/widgets/textfield_custom.dart';

import '../blocs/user/user_bloc.dart';
import '../widgets/item_nota.dart';

class Notas extends StatelessWidget {
  const Notas({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                const TextFieldCustom(
                  icon: Icons.note,
                ),
                const ElevatedButton(
                    onPressed: null, child: Text('Agregar nota')),
                SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 10),
                    ...state.lstNotas.map((nota) => ItemNota(
                        nota: Nota(
                          email: state.email,
                          id: nota.id,
                          text: nota.text,
                        ),
                        fn: (int id) {})),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
