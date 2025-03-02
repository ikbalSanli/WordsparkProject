import 'package:flutter/material.dart';
import '../service/word_service.dart';

class FlashcardWordsScreen extends StatefulWidget {
  final String unitId;
  final String unitName;

  const FlashcardWordsScreen({super.key, required this.unitId, required this.unitName});

  @override
  _FlashcardWordsScreenState createState() => _FlashcardWordsScreenState();
}

class _FlashcardWordsScreenState extends State<FlashcardWordsScreen> {
  final WordService _wordService = WordService();
  List<Map<String, dynamic>> words = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWords();
  }

  void fetchWords() async {
   // List<Map<String, dynamic>> fetchedWords = await _wordService.getWordsByUnit(widget.unitId);
    setState(() {
     //words = fetchedWords;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.unitName)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          var word = words[index];
          return Card(
            child: ListTile(
              title: Text(word['word'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Anlam: ${word['meaning']}", style: const TextStyle(fontSize: 16)),
                  Text("Örnek: ${word['example']}", style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
