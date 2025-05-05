import 'package:flutter/material.dart';
import 'package:wordspark/components/home/feature_card.dart';
import 'package:wordspark/components/home/stats_card.dart';
import 'package:wordspark/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primaryColor = const Color(0xFF6A1B9A);
  final Color secondaryColor = const Color(0xFF9C27B0);
  final Color accentColor = const Color(0xFFE1BEE7);
  final Color backgroundColor = const Color(0xFFF9F7FC);
  final Color textPrimaryColor = const Color(0xFF424242);
  final Color textSecondaryColor = const Color(0xFF757575);

  String userName = "Loading...";
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await _authService.getUserData();
      if (userData != null) {
        setState(() {
          userName = "${userData['firstName']} ${userData['lastName']}";
        });
      } else {
        setState(() {
          userName = "Bilinmeyen Kullanıcı";
        });
      }
    } catch (e) {
      setState(() {
        userName = "Hata oluştu";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Merhaba 👋',
                          style: TextStyle(
                            color: textSecondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          userName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textPrimaryColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person_outlined,
                          color: primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'İlerleme',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.trending_up_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 6,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.auto_stories,
                                color: Colors.white.withOpacity(0.8),
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '70/100 kelime',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              '%70',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildEnhancedStatCard(
                        title: 'Öğrenilen',
                        value: '1,234',
                        icon: Icons.auto_stories_rounded,
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildEnhancedStatCard(
                        title: 'Favoriler',
                        value: '56',
                        icon: Icons.favorite_rounded,
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                child: Text(
                  'Özellikler',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textPrimaryColor,
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate([
                  _buildEnhancedFeatureCard(
                    title: 'Kelime Kartları',
                    icon: Icons.style_rounded,
                    gradient: const [Color(0xFF1976D2), Color(0xFF42A5F5)],
                    onTap: () => Navigator.pushNamed(context, '/flashcards'),
                  ),
                  _buildEnhancedFeatureCard(
                    title: 'Okuma',
                    icon: Icons.menu_book_rounded,
                    gradient: const [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                    onTap: () => Navigator.pushNamed(context, '/reading'),
                  ),
                  _buildEnhancedFeatureCard(
                    title: 'Quiz',
                    icon: Icons.quiz_rounded,
                    gradient: const [Color(0xFFC62828), Color(0xFFEF5350)],
                    onTap: () => Navigator.pushNamed(context, '/quiz'),
                  ),
                  _buildEnhancedFeatureCard(
                    title: 'Gramer',
                    icon: Icons.school_rounded,
                    gradient: const [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
                    onTap: () => Navigator.pushNamed(context, '/grammar'),
                  ),
                ]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/chatbot'),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.psychology_alt_rounded,
                            color: primaryColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'AI Asistan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Sorularını yanıtlamak için hazır',
                                style: TextStyle(
                                  color: textSecondaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textSecondaryColor.withOpacity(0.7),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textPrimaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: textSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedFeatureCard({
    required String title,
    required IconData icon,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: gradient.first.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 22,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}