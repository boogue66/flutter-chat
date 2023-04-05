// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/widgets/widgets.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/helpers/mostrar_alerta.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Logo(titulo: 'Registro'),
                  _Form(),
                  Labels(
                    ruta: 'login',
                    titulo: '¿Ya tienes cuenta?',
                    tituloAzul: 'Inicia sesion ahora!',
                  ),
                  Terminos(),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form();
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final userCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            isPassword: false,
            icon: Icons.person_2_outlined,
            placeholder: 'Username',
            keyboardType: TextInputType.text,
            textController: userCtrl,
          ),
          CustomInput(
            isPassword: false,
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.password_outlined,
            placeholder: 'Password',
            keyboardType: TextInputType.number,
            textController: passwordCtrl,
          ),
          CustomButton(
            titulo: 'Crear cuenta',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    final registroOk = await authService.registro(
                      userCtrl.text.trim(),
                      emailCtrl.text.trim(),
                      passwordCtrl.text.trim(),
                    );
                    if (registroOk == true) {
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      mostrarAlerta(context, 'Registro incorrecto', registroOk);
                    }
                  },
          )
        ],
      ),
    );
  }
}
