import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteWords;

  // Varsayılan olarak boş liste kullan
  FavoritesScreen({this.favoriteWords = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favoriler")),
      body: favoriteWords.isEmpty
          ? Center(child: Text("Henüz favorilere eklenmiş kelime yok!"))
          : ListView.builder(
        itemCount: favoriteWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteWords[index]["english"]!),
            subtitle: Text(favoriteWords[index]["turkish"]!),
            leading: Icon(Icons.star, color: Colors.amber),
          );
        },
      ),
    );
  }
}
