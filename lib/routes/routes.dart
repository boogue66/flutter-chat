import 'package:flutter/material.dart';
import 'package:chat/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'loading': (_) => const LoadingPage(),
  'usuarios': (_) => const UsuariosPage(),
  'registro': (_) => const RegistroPage(),
};
