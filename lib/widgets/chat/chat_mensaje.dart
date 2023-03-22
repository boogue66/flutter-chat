import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.texto,
    required this.uid,
    required this.animationController,
  });

  final String texto;
  final String uid;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: Container(
          child: uid == '999' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, left: 50, right: 8),
          decoration: BoxDecoration(
            color: const Color(0xff0695FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            texto,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ));
  }

  Widget _notMyMessage() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, left: 8, right: 50),
          decoration: BoxDecoration(
            color: const Color(0xff828282),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            texto,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
