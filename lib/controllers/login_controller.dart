import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/login/login_bloc.dart';
import 'package:note_app/utils/validador.dart';

import '../blocs/user/user_bloc.dart';
import '../models/nota.dart';
import '../models/user.dart';
import '../providers/db_provider.dart';

class LoginController {
  final BuildContext context;
  late final LoginBloc bloc;
  late final UserBloc userBloc;

  LoginController({
    required this.context,
  }) {
    bloc = BlocProvider.of<LoginBloc>(
      context,
      listen: false,
    );

    userBloc = BlocProvider.of<UserBloc>(
      context,
      listen: false,
    );
  }

  void email(String value) {
    bloc.add(LoginEmailEvent(email: value));
  }

  String? validarEmail(String value) {
    if (!Validate(value).isEmail()) {
      bloc.add(const LoginErrorEmailEvent(errEmail: 'Correo no válido'));
    } else {
      bloc.add(const LoginErrorEmailEvent(errEmail: ''));
    }
    return null;
  }

  void password(String value) {
    bloc.add(LoginPasswordEvent(password: value));
  }

  bool botonActivo() {
    return bloc.state.errEmail == '' &&
        bloc.state.email != '' &&
        bloc.state.password != '';
  }

  loginUser() async {
    User? user = await DBProvider.db.getUser(bloc.state.email);
    if (user != null && user.password == bloc.state.password) {
      userBloc.add(UserEmailEvent(
        email: user.email,
      ));
      userBloc.add(UserFullNameEvent(
        fullName: user.fullName,
      ));

      List<Nota> lista = await DBProvider.db.getNotes(user.email);

      for (Nota item in lista) {
        userBloc.add(UserAddNotaEvent(nota: item));
      }
      if (context.mounted) {
        Navigator.popAndPushNamed(context, 'notas');
      }
    } else {
      bloc.add(const LoginMsgEvent(msg: 'Usuario invalido'));
    }
  }

  String? validarPassword(String value) {
    if (value.isEmpty) {
      bloc.add(
          const LoginMsgPasswordEvent(msg: 'El password no puede estar vacío'));
    } else {
      bloc.add(const LoginMsgPasswordEvent(msg: ''));
    }
    return null;
  }
}
