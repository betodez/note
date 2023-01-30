import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocks/registrar/registrar_bloc.dart';
import 'package:note_app/widgets/backgroud.dart';
import 'package:note_app/widgets/textfield_custom.dart';

import 'controllers/registra_controller.dart';

class Registrar extends StatelessWidget {
  const Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double separacion = 15;
    double height = MediaQuery.of(context).size.height;
    RegistrarBloc bloc = BlocProvider.of<RegistrarBloc>(context, listen: false);
    final Map<String, String> formValues = {
      'fullName': '',
      'email': '',
      'password': '',
      'repetirPassword': '',
    };

    return Scaffold(
      body: BlocBuilder<RegistrarBloc, RegistrarState>(builder: (_, state) {
        return Background(
          title: 'Registro',
          widget: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: separacion),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.3,
                  ),
                  TextFieldCustom(
                    icon: Icons.person,
                    labelText: 'Nombre completo',
                    hintText: 'Juan López Pérez',
                    errorText: state.errorFullName,
                    fn: (value) {
                      formValues['fullName'] = value ?? '';
                      return RegistrarController(context: context, bloc: bloc)
                          .validarName(formValues['fullName']);
                    },
                  ),
                  const SizedBox(height: separacion),
                  TextFieldCustom(
                    icon: Icons.email,
                    labelText: 'Correo electrónico',
                    hintText: 'tunombre@gmail.com',
                    errorText: state.errorEmail,
                    fn: (value) {
                      formValues['email'] = value ?? '';
                      return RegistrarController(context: context, bloc: bloc)
                          .validarEmail(formValues['email']);
                    },
                  ),
                  const SizedBox(height: separacion),
                  TextFieldCustom(
                    icon: Icons.key,
                    labelText: 'Contraseña',
                    obscureText: true,
                    errorText: state.errorPassword,
                    fn: (value) {
                      formValues['password'] = value ?? '';
                      RegistrarController(context: context, bloc: bloc)
                          .validarPassword(formValues['password']);
                      return RegistrarController(context: context, bloc: bloc)
                          .validarRepeatPassword(formValues['password'],
                              formValues['repetirPassword']);
                    },
                  ),
                  const SizedBox(height: separacion),
                  TextFieldCustom(
                    icon: Icons.key,
                    labelText: 'Repetir contraseña',
                    obscureText: true,
                    errorText: state.errorRepetirPassword,
                    fn: (value) {
                      formValues['repetirPassword'] = value ?? '';
                      return RegistrarController(context: context, bloc: bloc)
                          .validarRepeatPassword(formValues['password'],
                              formValues['repetirPassword']);
                    },
                  ),
                  const SizedBox(height: separacion),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Registrase')),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
