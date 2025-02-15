import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ana ekranın state yönetimi için model
class HomeScreenModel extends ChangeNotifier {
  int learnedWords = 0;
  int dailyGoal = 100;
  int dailyProgress = 0;
  int favoriteCount = 0;

  void updateStats({
    int? words,
    int? progress,
    int? favorites,
  }) {
    if (words != null) learnedWords = words;
    if (progress != null) dailyProgress = progress;
    if (favorites != null) favoriteCount = favorites;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  // Özellik kartları için veri modeli
  final List<FeatureCardData> features = [
    FeatureCardData(
      title: "Kelime Kartları",
      icon: Icons.credit_card,
      route: '/flashcards',
      gradient: [Color(0xFF3F51B5), Color(0xFF5C6BC0)],
    ),
    FeatureCardData(
      title: "Okuma Parçaları",
      icon: Icons.menu_book,
      route: '/reading',
      gradient: [Color(0xFF00897B), Color(0xFF26A69A)],
    ),
    FeatureCardData(
      title: "Gramer",
      icon: Icons.school,
      route: '/grammar',
      gradient: [Color(0xFF5E35B1), Color(0xFF7E57C2)],
    ),
    FeatureCardData(
      title: "Kelime Testi",
      icon: Icons.quiz,
      route: '/quiz',
      gradient: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenModel(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildStatsSection(),
                  _buildMainContent(context),
                  _buildChatbotCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120.0,
      floating: false,
      pinned: true,
      backgroundColor: Color(0xFF4A148C),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'WORD SPARK',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () => Navigator.pushNamed(context, '/favorites'),
        ),
        IconButton(
          icon: Icon(Icons.person_outline),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Consumer<HomeScreenModel>(
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatCard("Öğrenilen Kelimeler", "${model.learnedWords}", Icons.auto_stories),
            _buildStatCard("Günlük Hedef", "${model.dailyProgress}/${model.dailyGoal}", Icons.trending_up),
            _buildStatCard("Favoriler", "${model.favoriteCount}", Icons.favorite),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Color(0xFF4A148C), size: 24),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
      itemCount: features.length,
      itemBuilder: (context, index) => _buildFeatureCard(context, features[index]),
    );
  }

  Widget _buildFeatureCard(BuildContext context, FeatureCardData data) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, data.route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: data.gradient),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(data.icon, size: 40, color: Colors.white),
              SizedBox(height: 12),
              Text(data.title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatbotCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/chatbot'),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.chat, color: Color(0xFF4A148C)),
              SizedBox(width: 10),
              Text("Soru Asistanı", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCardData {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> gradient;

  FeatureCardData({required this.title, required this.icon, required this.route, required this.gradient});
}
