import 'package:flutter/material.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            alignment: Alignment.center,
            title: Text(titulo),
            content: Text(subtitulo),
            actions: [
              MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ],
          ));
}
