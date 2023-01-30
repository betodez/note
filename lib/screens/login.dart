import 'package:flutter/material.dart';
import 'package:note_app/widgets/backgroud.dart';
import 'package:note_app/widgets/textfield_custom.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final Map<String, String> formValues = {
      'fullName': '',
      'email': '',
      'password': '',
    };
    return Scaffold(
      body: Background(
          title: 'Inicio de sesión',
          widget: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.4,
                  ),
                  const TextFieldCustom(
                    icon: Icons.email,
                    hintText: 'tunombre@gmail.com',
                    labelText: 'Correo electrónico',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFieldCustom(
                    icon: Icons.key,
                    labelText: 'Contraseña',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const ElevatedButton(
                          onPressed: null, child: Text('Ingresar')),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'registrar'),
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
          )),
    );
  }
}
