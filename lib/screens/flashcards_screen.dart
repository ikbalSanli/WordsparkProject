import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:wordspark/components/flashcard/flashcard_widget.dart';
import 'package:wordspark/model/flashcard_model.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  late PageController _pageController;
  String? selectedUnit;
  final Map<int, GlobalKey<FlipCardState>> _cardKeys = {};

  final Map<String, List<Flashcard>> units = {
    "Ünite 1 - Food": [
      Flashcard(english: "Apple", turkish: "Elma", example: "I eat an apple every day."),
      Flashcard(english: "Water", turkish: "Su", example: "I drink water every day."),
    ],
    "Ünite 2 - Buildings": [
      Flashcard(english: "House", turkish: "Ev", example: "This is my house."),
    ],
    "Ünite 3 - Education": [
      Flashcard(english: "Book", turkish: "Kitap", example: "I love reading books."),
    ],
  };

  List<Flashcard> filteredFlashcards = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    filteredFlashcards = units["Ünite 1 - Food"]!;
  }

  void _filterFlashcards(String filter) {
    setState(() {
      if (filter == 'Öğrendiklerim') {
        filteredFlashcards = units[selectedUnit]!.where((flashcard) => flashcard.isLearned).toList();
      } else if (filter == 'Favorilerim') {
        filteredFlashcards = units[selectedUnit]!.where((flashcard) => flashcard.isFavorite).toList();
      } else {
        filteredFlashcards = units[selectedUnit]!;
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUnit == null ? "Üniteler" : selectedUnit!),
        backgroundColor: Colors.deepPurple,
        leading: selectedUnit != null
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => setState(() => selectedUnit = null),
        )
            : null,
        actions: selectedUnit == null
            ? null
            : [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),


      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Kelime Kartları", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Filtreleme Seçenekleri", style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list, color: Colors.deepPurple),
              title: const Text("Tüm Kelimeler"),
              onTap: () => _filterFlashcards("Tüm Kelimeler"),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.deepPurple),
              title: const Text("Öğrendiklerim"),
              onTap: () => _filterFlashcards("Öğrendiklerim"),
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.deepPurple),
              title: const Text("Favorilerim"),
              onTap: () => _filterFlashcards("Favorilerim"),
            ),
          ],
        ),
      ),
      body: selectedUnit == null ? _buildUnitList() : _buildFlashcards(),
    );
  }

  Widget _buildUnitList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: units.keys.length,
      itemBuilder: (context, index) {
        String unitName = units.keys.elementAt(index);
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() {
                selectedUnit = unitName;
                filteredFlashcards = units[selectedUnit]!;
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    // Sol taraftaki mor daire içinde kelime sayısı
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${units[unitName]!.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Ünite adı ve kelime sayısı yazısı
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            unitName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Bu ünitede ${units[unitName]!.length} adet kelime var.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Sağ taraftaki ok ikonu
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFlashcards() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: PageView.builder(
          controller: _pageController,
          itemCount: filteredFlashcards.length,
          physics: const BouncingScrollPhysics(),
          padEnds: false,
          itemBuilder: (context, index) {
            _cardKeys.putIfAbsent(index, () => GlobalKey<FlipCardState>());
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FlashcardWidget(
                flashcard: filteredFlashcards[index],
                onFavorite: (flashcard) => setState(() => flashcard.isFavorite = !flashcard.isFavorite),
                onLearned: (flashcard) => setState(() => flashcard.isLearned = !flashcard.isLearned),
                cardKey: _cardKeys[index]!,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
