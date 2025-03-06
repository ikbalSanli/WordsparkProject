import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardsScreen extends StatelessWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelime Kartları")),
      body: ListView(
        children: ["A1", "A2", "B1", "B2"].map((level) {
          return ListTile(
            title: Text(level, style: const TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordListScreen(level: level),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class WordListScreen extends StatelessWidget {
  final String level;
  const WordListScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$level Kelimeleri")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('flashcards')
            .where('level', isEqualTo: level)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Bu seviyede kelime bulunamadı."));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: snapshot.data!.docs.map((doc) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: FlashcardWidget(doc: doc),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FlashcardWidget extends StatefulWidget {
  final DocumentSnapshot doc;

  const FlashcardWidget({super.key, required this.doc});

  @override
  _FlashcardWidgetState createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> with TickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _rotation = Tween<double>(begin: 0.0, end: 3.14159).animate(_controller);
  }

  void _toggleCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  void _toggleFavorite() {
    // Toggle favorite status in Firestore
    FirebaseFirestore.instance.collection('flashcards').doc(widget.doc.id).update({
      'favorite': !(widget.doc['favorite'] ?? false),
    });
  }

  void _markLearned() {
    // Toggle learned status in Firestore
    FirebaseFirestore.instance.collection('flashcards').doc(widget.doc.id).update({
      'learned': !(widget.doc['learned'] ?? false),
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY(_rotation.value),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: _isFlipped
              ? CardContent(
            content: widget.doc['meaning'] ?? 'No meaning available',
            isBack: true,
            isFavorite: widget.doc['favorite'] ?? false,
            isLearned: widget.doc['learned'] ?? false,
            onFavoriteTap: _toggleFavorite,
            onLearnedTap: _markLearned,
          )
              : CardContent(
            content: widget.doc['word'] ?? 'No word available',
            isBack: false,
            isFavorite: widget.doc['favorite'] ?? false,
            isLearned: widget.doc['learned'] ?? false,
            onFavoriteTap: _toggleFavorite,
            onLearnedTap: _markLearned,
          ),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String content;
  final bool isBack;
  final bool isFavorite;
  final bool isLearned;
  final VoidCallback onFavoriteTap;
  final VoidCallback onLearnedTap;

  const CardContent({
    super.key,
    required this.content,
    required this.isBack,
    required this.isFavorite,
    required this.isLearned,
    required this.onFavoriteTap,
    required this.onLearnedTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: isBack ? Colors.blueAccent : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isBack ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          if (!isBack)
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.heart_broken : Icons.heart_broken_outlined,
                color: Colors.red,
              ),
              onPressed: onFavoriteTap,
            ),
            IconButton(
              icon: Icon(
                isLearned ? Icons.check_circle : Icons.check_circle_outline,
                color: Colors.green,
              ),
              onPressed: onLearnedTap,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Favorim',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(width: 5),
            Text(
              'Öğrendim',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ],
    )
],
      ),
    );
  }
}
