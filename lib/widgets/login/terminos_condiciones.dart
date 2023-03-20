import 'package:flutter/material.dart';

class Terminos extends StatelessWidget {
  const Terminos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Terminos y condiciones de uso',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.black45,
        ),
      ),
    );
  }
}
