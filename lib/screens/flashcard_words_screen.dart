import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardWordsScreen extends StatelessWidget {
  final String unit;

  const FlashcardWordsScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('$unit Kelimeleri'),
        backgroundColor: const Color(0xFF4A148C),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('flashcards')
            .doc(unit)
            .collection('words')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Bu üniteye henüz kelime eklenmemiş"),
            );
          }

          var flashcards = snapshot.data!.docs;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: flashcards.map<Widget>((flashcard) {
                String word = flashcard['word'];
                String meaning = flashcard['meaning'];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FlashcardCard(
                    word: word,
                    meaning: meaning,
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class FlashcardCard extends StatelessWidget {
  final String word;
  final String meaning;

  const FlashcardCard({super.key, required this.word, required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.purple.shade800, // Kartın rengini belirleyebilirsiniz
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 200, // Kart genişliği
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              word, // Kelimeyi göster
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              meaning, // Anlamı göster
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
