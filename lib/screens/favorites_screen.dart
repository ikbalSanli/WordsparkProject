import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteWords;

  // Varsayılan olarak boş liste kullan
  const FavoritesScreen({super.key, this.favoriteWords = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoriler")),
      body: favoriteWords.isEmpty
          ? const Center(child: Text("Henüz favorilere eklenmiş kelime yok!"))
          : ListView.builder(
        itemCount: favoriteWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteWords[index]["english"]!),
            subtitle: Text(favoriteWords[index]["turkish"]!),
            leading: const Icon(Icons.star, color: Colors.amber),
          );
        },
      ),
    );
  }
}
