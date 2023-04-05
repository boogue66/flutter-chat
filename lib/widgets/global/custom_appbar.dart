import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return AppBar(
      centerTitle: true,
      title: Text(usuario.nombre,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.black54,
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
          AuthService.deleteToken();
        },
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          //child: Icon(Icons.error, color: Colors.red[400]),
          child: Icon(Icons.check_circle, color: Colors.blue[400]),
        )
      ],
    );
  }
}
