import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'https://api-chat-qeh8.onrender.com/api'
      : 'http://localhost:3000/api';
  static String socketUrl = Platform.isAndroid
      ? 'https://api-chat-qeh8.onrender.com/api'
      : 'http://localhost:3000';
}
