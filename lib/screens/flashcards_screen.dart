import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'favorites_screen.dart';

class FlashcardsScreen extends StatefulWidget {
  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final List<Map<String, String>> words = [
    {"english": "Apple", "turkish": "Elma"},
    {"english": "Car", "turkish": "Araba"},
    {"english": "House", "turkish": "Ev"},
  ];

  final List<Map<String, String>> favoriteWords = [];

  void toggleFavorite(Map<String, String> word) {
    setState(() {
      if (favoriteWords.contains(word)) {
        favoriteWords.remove(word);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${word["english"]} favorilerden çıkarıldı!")),
        );
      } else {
        favoriteWords.add(word);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${word["english"]} favorilere eklendi!")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelime Kartları"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteWords: favoriteWords),

                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: PageView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            final word = words[index];
            final isFavorite = favoriteWords.contains(word);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: _buildCard(word["english"]!),
                      back: _buildCard(word["turkish"]!),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 35,
                        ),
                        onPressed: () => toggleFavorite(word),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 350,
        height: 300,
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
