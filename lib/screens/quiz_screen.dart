import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Center(
        child: Text(
          'Burası quiz Sayfası!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
