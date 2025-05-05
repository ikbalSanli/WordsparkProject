import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF6A1B9A),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF6A1B9A),
    secondary: const Color(0xFF9C27B0),
    background: const Color(0xFFF3E5F5),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF6A1B9A),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
);

class FlashcardsScreen extends StatelessWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
        backgroundColor: appTheme.colorScheme.background,
        appBar: AppBar(title: const Text("Kelime Kartları")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: ["A1", "A2", "B1", "B2", "C1", "C2"].map((level) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  title: Text(
                    level,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B9A),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF6A1B9A),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordListScreen(level: level),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class WordListScreen extends StatefulWidget {
  final String level;
  const WordListScreen({super.key, required this.level});

  @override
  State<WordListScreen> createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  String _filterOption = "all";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Theme(
      data: appTheme,
      child: Scaffold(
        backgroundColor: appTheme.colorScheme.background,
        appBar: AppBar(
          title: Text("${widget.level} Kelimeleri"),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: _showFilterOptions,
              tooltip: "Filtrele",
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _getFilterText(),
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF6A1B9A),
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: _getFilteredStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF6A1B9A),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 64,
                            color: Color(0xFF9C27B0),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _filterOption != "all"
                                ? "Bu filtreye uygun kelime bulunamadı"
                                : "Bu seviyede kelime bulunamadı",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF6A1B9A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  final List<DocumentSnapshot> orderedDocs = snapshot.data!.docs.toList();

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Kartları çevirmek için dokunun",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          "${orderedDocs.length} kelime bulundu",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6A1B9A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Expanded(
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 1.0),
                            itemCount: orderedDocs.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlashcardWidget(
                                    doc: orderedDocs[index],
                                    screenSize: screenSize,
                                    currentIndex: index + 1,
                                    totalCards: orderedDocs.length,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Kelimeleri Filtrele",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              icon: Icons.language,
              title: "Tüm Kelimeler",
              value: "all",
            ),
            _buildFilterOption(
              icon: Icons.favorite,
              title: "Favorilerim",
              value: "favorites",
            ),
            _buildFilterOption(
              icon: Icons.check_circle,
              title: "Öğrendiklerim",
              value: "learned",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: _filterOption == value
            ? const Color(0xFF6A1B9A)
            : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _filterOption == value
              ? const Color(0xFF6A1B9A)
              : Colors.black,
          fontWeight: _filterOption == value
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
      trailing: _filterOption == value
          ? const Icon(
        Icons.check,
        color: Color(0xFF6A1B9A),
      )
          : null,
      onTap: () {
        setState(() {
          _filterOption = value;
        });
        Navigator.pop(context);
      },
    );
  }

  Stream<QuerySnapshot> _getFilteredStream() {
    Query query = FirebaseFirestore.instance
        .collection('flashcards')
        .where('level', isEqualTo: widget.level);

    if (_filterOption == "favorites") {
      query = query.where('favorite', isEqualTo: true);
    } else if (_filterOption == "learned") {
      query = query.where('learned', isEqualTo: true);
    }

    return query.snapshots();
  }

  String _getFilterText() {
    switch (_filterOption) {
      case "favorites":
        return "Favorilere eklediğiniz kelimeler gösteriliyor";
      case "learned":
        return "Öğrendiğiniz kelimeler gösteriliyor";
      default:
        return "Tüm kelimeler gösteriliyor";
    }
  }
}

class FlashcardWidget extends StatefulWidget {
  final DocumentSnapshot doc;
  final Size screenSize;
  final int currentIndex;
  final int totalCards;

  const FlashcardWidget({
    super.key,
    required this.doc,
    required this.screenSize,
    required this.currentIndex,
    required this.totalCards,
  });

  @override
  _FlashcardWidgetState createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> with TickerProviderStateMixin {
  bool _showFront = true;
  late AnimationController _controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _frontRotation = Tween<double>(begin: 0.0, end: 3.14159 / 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _backRotation = Tween<double>(begin: 3.14159 / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _toggleCard() {
    if (_showFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _showFront = !_showFront;
    });
  }

  void _toggleFavorite() {
    FirebaseFirestore.instance.collection('flashcards').doc(widget.doc.id).update({
      'favorite': !(widget.doc['favorite'] ?? false),
    });
  }

  void _markLearned() {
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
    final double cardWidth = widget.screenSize.width * 0.9;
    final double cardHeight = widget.screenSize.height * 0.65;

    return Column(
      children: [
        Text(
          "${widget.currentIndex} / ${widget.totalCards}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),

        // Kart
        GestureDetector(
          onTap: _toggleCard,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  // Ön yüz
                  _buildCardSide(
                    rotation: _frontRotation.value,
                    isVisible: _showFront,
                    isBack: false,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  // Arka yüz
                  _buildCardSide(
                    rotation: _backRotation.value,
                    isVisible: !_showFront,
                    isBack: true,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCardSide({
    required double rotation,
    required bool isVisible,
    required bool isBack,
    required double width,
    required double height,
  }) {
    return Visibility(
      visible: isVisible,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotation),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: appTheme.colorScheme.primary.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: _buildCardContent(isBack, width, height),
        ),
      ),
    );
  }

  Widget _buildCardContent(bool isBack, double width, double height) {
    final bool isFavorite = widget.doc['favorite'] ?? false;
    final bool isLearned = widget.doc['learned'] ?? false;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isBack
              ? [const Color(0xFF9C27B0), const Color(0xFF6A1B9A)]
              : [Colors.white, Colors.grey.shade50],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  isBack
                      ? (widget.doc['meaning'] ?? 'Anlam bulunamadı')
                      : (widget.doc['word'] ?? 'Kelime bulunamadı'),
                  style: TextStyle(
                    fontSize: _calculateFontSize(width),
                    fontWeight: FontWeight.bold,
                    color: isBack ? Colors.white : const Color(0xFF6A1B9A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          if (!isBack)
            Column(
              children: [
                const Divider(color: Color(0xFFC5CAE9), thickness: 1),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      label: 'Favorim',
                      color: Colors.red,
                      onTap: _toggleFavorite,
                    ),
                    _buildActionButton(
                      icon: isLearned ? Icons.check_circle : Icons.check_circle_outline,
                      label: 'Öğrendim',
                      color: Colors.green,
                      onTap: _markLearned,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  double _calculateFontSize(double width) {
    if (width < 300) {
      return 18;
    } else if (width < 400) {
      return 22;
    } else {
      return 24;
    }
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}