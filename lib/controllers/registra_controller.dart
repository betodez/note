import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/user/user_bloc.dart';
import 'package:note_app/models/user.dart';
import 'package:note_app/providers/db_provider.dart';

import '../../blocs/registrar/registrar_bloc.dart';
import '../../utils/validador.dart';

class RegistrarController {
  final BuildContext context;
  late final UserBloc userBloc;
  late final RegistrarBloc registrarBloc;

  final Map<String, String> formValues = {
    'fullName': '',
    'email': '',
    'password': '',
    'repetirPassword': '',
  };

  RegistrarController({
    required this.context,
  }) {
    userBloc = BlocProvider.of<UserBloc>(
      context,
      listen: false,
    );

    registrarBloc = BlocProvider.of<RegistrarBloc>(
      context,
      listen: false,
    );
  }

  String? validarRepeatPassword({password, repeatPassword}) {
    if ((registrarBloc.state.password == repeatPassword) ||
        (registrarBloc.state.repeatPassword == password)) {
      registrarBloc.add(const ValidoRegistrarPasswordRepeatEvent());
    } else {
      registrarBloc.add(const ErrorRegistrarPasswordRepeatEvent(
          'La contraseñas no son iguales'));
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (!Validate(value ?? '').isPassword()) {
      registrarBloc.add(const ErrorRegistrarPasswordEvent('''
La contraseña debe al menos un dígito, 
al menos una minúscula, 
al menos una mayúscula y 
al menos un caracter no alfanumérico.'''));
    } else if (value!.length < 8) {
      registrarBloc.add(const ErrorRegistrarPasswordShortEvent(
          'Debe tener al menos 8 caracteres'));
    } else {
      registrarBloc.add(const ValidoRegistrarPasswordEvent());
    }
    return null;
  }

  String? validarName(String? value) {
    if (!Validate(value ?? '').isName()) {
      registrarBloc.add(const ErrorRegistrarNameEvent('No se aceptan números'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarNameEmptyEvent(
          'El Nombre no puede quedar vacío'));
    } else {
      registrarBloc.add(const ValidoRegistrarNameEvent());
    }
    return null;
  }

  String? validarEmail(String? value) {
    if (!Validate(value ?? '').isEmail()) {
      registrarBloc.add(const ErrorRegistrarEmailEvent('Correo no válido'));
    } else {
      registrarBloc.add(const ValidoRegistrarEmailEvent());
    }
    return null;
  }

  bool botonActivo() {
    return registrarBloc.state.errorEmail == '' &&
        registrarBloc.state.errorFullName == '' &&
        registrarBloc.state.errorPassword == '' &&
        registrarBloc.state.errorRepetirPassword == '' &&
        registrarBloc.state.fullName != '' &&
        registrarBloc.state.email != '' &&
        registrarBloc.state.password != '';
  }

  void registraUser() async {
    User user = User(
      fullName: registrarBloc.state.fullName,
      email: registrarBloc.state.email,
      password: registrarBloc.state.password,
    );
    User? temp = await DBProvider.db.getUser(user.email);
    if (temp == null) {
      await DBProvider.db.addUser(user);
      registrarBloc.add(const RegistrarMessageEvent(
        '',
      ));
      userBloc.add(UserEmailEvent(
        email: user.email,
      ));
      userBloc.add(UserFullNameEvent(
        fullName: user.fullName,
      ));
    } else {
      registrarBloc.add(const RegistrarMessageEvent(
        'El correo ya existe',
      ));
    }
  }

  void email(String? value) {
    registrarBloc.add(RegistrarEmailEvent(value ?? ''));
  }

  void fullName(String? value) {
    registrarBloc.add(RegistrarFullNameEvent(value ?? ''));
  }

  void password(String? value) {
    registrarBloc.add(RegistrarPasswordEvent(value ?? ''));
  }

  void repeatPassword(String? value) {
    registrarBloc.add(RegistrarRepeatPasswordEvent(value ?? ''));
  }
}
