 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wordspark/components/settings/info_row.dart';

Widget buildInfoCard(Map<String, dynamic>? userData) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kişisel Bilgiler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            Divider(color: Colors.blue.shade100),
            buildInfoRow(Icons.email, 'E-posta', userData?['email'] ?? ''),
            buildInfoRow(Icons.cake, 'Doğum Tarihi', 
              formatDate(userData?['birthDate'])),
            buildInfoRow(Icons.person, 'Cinsiyet', userData?['gender'] ?? ''),
            buildInfoRow(Icons.calendar_today, 'Kayıt Tarihi', 
              formatDate(userData?['createdAt'])),
          ],
        ),
      ),
    );
    
  }

   String formatDate(String? dateString) {
    if (dateString == null) return 'Belirtilmedi';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd.MM.yyyy').format(date);
    } catch (e) {
      return 'Geçersiz tarih';
    }
  }
