import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/registrar/registrar_bloc.dart';
import 'package:note_app/blocs/user/user_bloc.dart';
import 'package:note_app/controllers/registra_controller.dart';
import 'package:note_app/models/user.dart';
import 'package:note_app/widgets/backgroud.dart';
import 'package:note_app/widgets/textfield_custom.dart';

class Registrar extends StatelessWidget {
  const Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double separacion = 15;
    double height = MediaQuery.of(context).size.height;
    RegistrarController controller = RegistrarController(context: context);

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
                      return controller.validarName(formValues['fullName']);
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
                      return controller.validarEmail(formValues['email']);
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
                      controller.validarPassword(formValues['password']);
                      return controller.validarRepeatPassword(
                          formValues['password'],
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
                      return controller.validarRepeatPassword(
                          formValues['password'],
                          formValues['repetirPassword']);
                    },
                  ),
                  const SizedBox(height: separacion),
                  ElevatedButton(
                      onPressed: !controller.botonActivo(formValues)
                          ? null
                          : () => controller
                              .registraUser(User.mapToUser(formValues)),
                      child: const Text('Registrase')),
                  SizedBox(height: 100, child: Text(state.message)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
