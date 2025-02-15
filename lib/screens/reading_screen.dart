import 'package:flutter/material.dart';

class ReadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading')),
      body: Center(
        child: Text(
          'Burası reading Sayfası!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
