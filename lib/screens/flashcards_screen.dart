import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelime Kartları',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF2C2C2E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4A148C),
          elevation: 0,
        ),
      ),
      home: const FlashcardsScreen(),
    );
  }
}

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedUnit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelime Kartları'),
      ),
      body: Column(
        children: [
          // Ünite Seçimi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple.withOpacity(0.3)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xFF3A3A3C),
                  isExpanded: true,
                  hint: const Text(
                    "Ünite Seçin",
                    style: TextStyle(color: Colors.white70),
                  ),
                  value: selectedUnit,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.purple),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (newUnit) {
                    setState(() {
                      selectedUnit = newUnit;
                    });
                  },
                  items: ['unit1', 'unit2', 'unit3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Kelime Kartları
          if (selectedUnit == null)
            const Expanded(
              child: Center(
                child: Text(
                  'Lütfen bir ünite seçin',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),
            ),
          if (selectedUnit != null)
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('flashcards')
                    .doc(selectedUnit)
                    .collection('words')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "Bu üniteye henüz kelime eklenmemiş",
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }

                  var flashcards = snapshot.data!.docs;

                  return Column(
                    children: [
                      // Kartlar
                      Expanded(
                        child: SingleChildScrollView(
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
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class FlashcardCard extends StatefulWidget {
  final String word;
  final String meaning;

  const FlashcardCard({super.key, required this.word, required this.meaning});

  @override
  _FlashcardCardState createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard> {
  bool _isFlipped = false;
  bool _isLearned = false;
  bool _isFavorite = false;

  void _toggleCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.94; // Kart boyutunu ekran boyutuna göre ayarla

    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: Card(
          key: ValueKey<bool>(_isFlipped),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: _isLearned ? Colors.green.shade700 : Colors.purple.shade800,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: width, // Kart boyutunu ayarla
            child: Column(
              children: [
                // Üst Butonlar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isLearned ? Icons.check_circle : Icons.check_circle_outline,
                        color: _isLearned ? Colors.green.shade300 : Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _isLearned = !_isLearned;
                        });
                      },
                    ),
                  ],
                ),
                // İçerik
                Expanded(
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: Text(
                        _isFlipped ? widget.meaning : widget.word,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                // Alt Bilgi
                Text(
                  _isFlipped ? "Mean" : "Word",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
