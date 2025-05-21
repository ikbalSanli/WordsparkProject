import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreUploader {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadFlashcardsFromJson(String jsonPath) async {
    try {
      final String jsonString = await rootBundle.loadString(jsonPath);
      final List<dynamic> jsonData = json.decode(jsonString);

      WriteBatch batch = _firestore.batch();

      for (var item in jsonData) {
        final docRef = _firestore.collection('flashcards').doc();
        batch.set(docRef, {
          'word': item['word'],
          'meaning': item['meaning'],
          'level': item['level'],
          'learned': item['learned'] ?? false,
          'favorite': item['favorite'] ?? false,
          //'createdAt': FieldValue.serverTimestamp(),
        });
      }

      await batch.commit();
      print('✅ Flashcards koleksiyonuna başarıyla eklendi.');
    } catch (e) {
      print('❌ Hata: $e');
    }
  }
}
