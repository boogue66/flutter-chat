import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titulo,
    required this.onPressed,
  });

  final String titulo;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: Colors.blue,
        minimumSize: const Size(300, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onPressed(),
      child: Text(
        titulo,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
