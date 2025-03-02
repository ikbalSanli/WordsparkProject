import 'package:flutter/material.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gramer')),
      body: const Center(
        child: Text(
          'Burası Gramer Sayfası!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
