import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/flashcard_model.dart';

class WordService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Flashcard>> getWordsByUnit(String unitId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('units')
          .doc(unitId)
          .collection('words')
          .get();

      return snapshot.docs.map((doc) {
        return Flashcard(
          english: doc['english'],
          turkish: doc['turkish'],
          example: doc['example'],
          isFavorite: doc['isFavorite'] ?? false,
          isLearned: doc['isLearned'] ?? false,
        );
      }).toList();
    } catch (e) {
      print("Error fetching words: $e");
      return [];
    }
  }
}
