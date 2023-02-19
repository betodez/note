import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';
import '../models/nota.dart';
import '../providers/db_provider.dart';

class NotaController {
  final BuildContext context;
  late final UserBloc userBloc;

  NotaController({required this.context}) {
    userBloc = BlocProvider.of<UserBloc>(
      context,
      listen: false,
    );
  }

  addNote() async {
    Nota nota = Nota(
      email: userBloc.state.email,
      text: userBloc.state.contenido,
      id: 0,
    );
    await DBProvider.db.addNote(nota);
    userBloc.add(UserAddNotaEvent(nota: nota));
    userBloc.add(const UserContenidoEvent(value: ''));
  }

  void addContenido(String value) {
    userBloc.add(UserContenidoEvent(value: value));
  }
}
