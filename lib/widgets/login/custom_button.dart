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
      ),
      onPressed: () => onPressed(),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            titulo,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
