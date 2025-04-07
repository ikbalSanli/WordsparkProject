import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reading')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('readings')
            .orderBy('level') // Kolaydan zora sıralama
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Henüz okuma metni eklenmedi.'));
          }

          final readings = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: readings.length,
            itemBuilder: (context, index) {
              var reading = readings[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12.0),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(reading['imageUrl'] ??
                        'https://i.imgur.com/xyz123.jpg'), // Varsayılan resim
                  ),
                  title: Text(
                    reading['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Seviye: ${reading['level']}",
                    style: TextStyle(color: getLevelColor(reading['level'])),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingDetailScreen(
                          title: reading['title'],
                          content: reading['content'],
                          level: reading['level'],
                          imageUrl: reading['imageUrl'] ??
                              'https://via.placeholder.com/400', // Varsayılan resim
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Color getLevelColor(String level) {
  switch (level) {
    case "A1":
      return Colors.green;
    case "A2":
      return Colors.blue;
    case "B1":
      return Colors.orange;
    case "B2":
      return Colors.purple;
    case "C1":
      return Colors.red;
    case "C2":
      return Colors.black;
    default:
      return Colors.grey;
  }
}

class ReadingDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String level;
  final String imageUrl;

  const ReadingDetailScreen({
    super.key,
    required this.title,
    required this.content,
    required this.level,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$title - $level")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Seviye: $level",
                style: TextStyle(color: getLevelColor(level), fontSize: 18),
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: const TextStyle(fontSize: 18, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
