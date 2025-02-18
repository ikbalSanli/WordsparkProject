import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatbot')),
      body: const Center(
        child: Text(
          'Burası chatbot Sayfası!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
