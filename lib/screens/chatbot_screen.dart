import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Center(
        child: Text(
          'Burası chatbot Sayfası!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
