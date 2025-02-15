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

  void addToFavorites(Map<String, String> word) {
    if (!favoriteWords.contains(word)) {
      setState(() {
        favoriteWords.add(word);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${word["english"]} favorilere eklendi!")),
      );
    }
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
            return Stack(
              children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: _buildCard(words[index]["english"]!, Icons.translate),
                  back: _buildCard(words[index]["turkish"]!, Icons.language),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.star_border, color: Colors.white, size: 30),
                    onPressed: () => addToFavorites(words[index]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(String text, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.white),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
