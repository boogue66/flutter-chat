import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(
      {super.key,
      required this.ruta,
      required this.titulo,
      required this.tituloAzul});
  final String ruta;
  final String titulo;
  final String tituloAzul;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, ruta),
          child: Text(
            tituloAzul,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
            ),
          ),
        ),
      ],
    );
  }
}
