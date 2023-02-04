import 'package:flutter/material.dart';

import '../../blocks/registrar/registrar_bloc.dart';
import '../../utils/validador.dart';

class RegistrarController {
  final BuildContext context;
  final RegistrarBloc bloc;

  RegistrarController({
    required this.context,
    required this.bloc,
  });

  String? validarRepeatPassword(String? password, String? repetirPassword) {
    if (password != repetirPassword) {
      bloc.add(const ErrorRegistrarPasswordRepeatEvent(
          'La contraseñas no son iguales'));
    } else {
      bloc.add(const ValidoRegistrarPasswordRepeatEvent());
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (!Validate(value ?? '').isPassword()) {
      bloc.add(const ErrorRegistrarPasswordEvent('''
La contraseña debe al menos un dígito, 
al menos una minúscula, 
al menos una mayúscula y 
al menos un caracter no alfanumérico.'''));
    } else if (value!.length < 8) {
      bloc.add(const ErrorRegistrarPasswordShortEvent(
          'Debe tener al menos 8 caracteres'));
    } else {
      bloc.add(const ValidoRegistrarPasswordEvent());
    }
    return null;
  }

  String? validarName(String? value) {
    if (!Validate(value ?? '').isName()) {
      bloc.add(const ErrorRegistrarNameEvent('No se aceptan números'));
    } else if (value!.isEmpty) {
      bloc.add(const ErrorRegistrarNameEmptyEvent(
          'El Nombre no puede quedar vacío'));
    } else {
      bloc.add(const ValidoRegistrarNameEvent());
    }
    return null;
  }

  String? validarEmail(String? value) {
    if (!Validate(value ?? '').isEmail()) {
      bloc.add(const ErrorRegistrarEmailEvent('Correo no válido'));
    } else {
      bloc.add(const ValidoRegistrarEmailEvent());
    }
    return null;
  }

  bool botonActivo(Map<String, String> usuario) {
    return bloc.state.errorEmail == '' &&
        bloc.state.errorFullName == '' &&
        bloc.state.errorPassword == '' &&
        bloc.state.errorRepetirPassword == '' &&
        usuario['fullName'] != '' &&
        usuario['email'] != '' &&
        usuario['password'] != '' &&
        usuario['repetirPassword'] != '';
  }
}
