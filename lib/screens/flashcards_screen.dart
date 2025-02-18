

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:wordspark/components/flashcard/flashcard_widget.dart';
import 'package:wordspark/model/flashcard_model.dart';



// örnek veri böyle gelicek
final List<Flashcard> sampleFlashcards = [
  Flashcard(
    english: "Apple",
    turkish: "Elma",
    example: "I eat an apple every day.",
    category: "Food",
  ),
  Flashcard(
    english: "House",
    turkish: "Ev",
    example: "This is my house.",
    category: "Buildings",
  ),
  Flashcard(
    english: "Book",
    turkish: "Kitap",
    example: "I love reading books.",
    category: "Education",
  ),
  Flashcard(
    english: "Car",
    turkish: "Araba",
    example: "My car is red.",
    category: "Transportation",
  ),
  Flashcard(
    english: "Sun",
    turkish: "Güneş",
    example: "The sun is shining brightly.",
    category: "Nature",
  ),
  Flashcard(
    english: "Water",
    turkish: "Su",
    example: "I drink water every day.",
    category: "Basics",
  ),
  Flashcard(
    english: "Phone",
    turkish: "Telefon",
    example: "Can I use your phone?",
    category: "Technology",
  ),
  Flashcard(
    english: "Friend",
    turkish: "Arkadaş",
    example: "She is my best friend.",
    category: "Relationships",
  ),
  Flashcard(
    english: "Time",
    turkish: "Zaman",
    example: "What time is it?",
    category: "Basics",
  ),
  Flashcard(
    english: "Music",
    turkish: "Müzik",
    example: "I love listening to music.",
    category: "Entertainment",
  ),
];


class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  late PageController _pageController;
  late List<Flashcard> flashcards;
  final Map<int, GlobalKey<FlipCardState>> _cardKeys = {};

  @override
  void initState() {
    super.initState();
    flashcards = sampleFlashcards;
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Kelime Kartları",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black87),
            onPressed: _showFilterDialog,
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressBar(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                _cardKeys.putIfAbsent(index, () => GlobalKey<FlipCardState>());
                return FlashcardWidget(
                  flashcard: flashcards[index],
                  onFavorite: _toggleFavorite,
                  onLearned: _toggleLearned,
                  cardKey: _cardKeys[index]!,
                );
              },
            ),
          ),
          _buildNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    int learnedCount = flashcards.where((f) => f.isLearned).length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: learnedCount / flashcards.length,
              backgroundColor: Colors.grey.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6A11CB)),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$learnedCount/${flashcards.length} Kelime Öğrenildi",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            color: const Color(0xFF6A11CB),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final currentIndex = _pageController.page?.round() ?? 0;
              _cardKeys[currentIndex]?.currentState?.toggleCard();
            },
            color: const Color(0xFF6A11CB),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            color: const Color(0xFF6A11CB),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Filtreleme Seçenekleri",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildFilterOption(
                "Tüm Kelimeler",
                Icons.list,
                () {
                  setState(() => flashcards = sampleFlashcards);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              _buildFilterOption(
                "Sadece Favoriler",
                Icons.favorite,
                () {
                  setState(() {
                    flashcards = sampleFlashcards.where((f) => f.isFavorite).toList();
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              _buildFilterOption(
                "Öğrenilmemiş Kelimeler",
                Icons.school,
                () {
                  setState(() {
                    flashcards = sampleFlashcards.where((f) => !f.isLearned).toList();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF6A11CB)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: const Color(0xFF6A11CB).withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      dense: true,
    );
  }

  void _toggleFavorite(Flashcard flashcard) {
    setState(() {
      flashcard.isFavorite = !flashcard.isFavorite;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            flashcard.isFavorite
                ? "${flashcard.english} favorilere eklendi!"
                : "${flashcard.english} favorilerden çıkarıldı!",
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  void _toggleLearned(Flashcard flashcard) {
    setState(() {
      flashcard.isLearned = !flashcard.isLearned;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            flashcard.isLearned
                ? "${flashcard.english} öğrenildi olarak işaretlendi!"
                : "${flashcard.english} öğrenilmedi olarak işaretlendi!",
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }



  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}