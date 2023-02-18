import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/login/login_bloc.dart';
import 'package:note_app/controllers/login_controller.dart';
import 'package:note_app/widgets/backgroud.dart';
import 'package:note_app/widgets/textfield_custom.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    LoginController controller = LoginController(context: context);

    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
        return Background(
            title: 'Inicio de sesión',
            widget: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.4,
                    ),
                    TextFieldCustom(
                      icon: Icons.email,
                      hintText: 'tunombre@gmail.com',
                      labelText: 'Correo electrónico',
                      errorText: state.errEmail,
                      fn: (value) {
                        controller.email(value ?? '');
                        return controller.validarEmail(value ?? '');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldCustom(
                      icon: Icons.key,
                      labelText: 'Contraseña',
                      errorText: state.msgPassword,
                      obscureText: true,
                      fn: (value) {
                        controller.password(value ?? '');
                        return controller.validarPassword(value ?? '');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: !controller.botonActivo()
                                ? null
                                : () => controller.loginUser(),
                            child: const Text('Ingresar')),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'registrar'),
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
