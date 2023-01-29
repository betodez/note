import 'package:flutter/material.dart';
import 'package:note_app/widgets/backgroud.dart';
import 'package:note_app/widgets/textfield_custom.dart';

class Registrar extends StatelessWidget {
  const Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double separacion = 15;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Background(
        title: 'Registro',
        widget: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: separacion),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.3,
                ),
                const TextFieldCustom(
                  icon: Icons.person,
                  labelText: 'Nombre completo',
                  hintText: 'Juan López Pérez',
                ),
                const SizedBox(height: separacion),
                const TextFieldCustom(
                  icon: Icons.email,
                  labelText: 'Correo electrónico',
                  hintText: 'tunombre@gmail.com',
                ),
                const SizedBox(height: separacion),
                const TextFieldCustom(
                  icon: Icons.key,
                  labelText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: separacion),
                const TextFieldCustom(
                  icon: Icons.key,
                  labelText: 'Repetir contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: separacion),
                const ElevatedButton(
                    onPressed: null, child: Text('Registrase')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
