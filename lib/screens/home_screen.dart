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
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
              ),
            ),

            // Kartlar alt alta dizilmiş halde
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildEnhancedFeatureCard(
                    title: 'Kelime Kartları',
                    subtitle: 'Yeni kelimeler öğren ve tekrar et',
                    icon: Icons.style_rounded,
                    gradient: const [Color(0xFF667eea), Color(0xFF764ba2)],
                    onTap: () => Navigator.pushNamed(context, '/flashcards'),
                  ),
                  const SizedBox(height: 16),
                  _buildEnhancedFeatureCard(
                    title: 'Okuma',
                    subtitle: 'Hikayeler okuyarak gelişim sağla',
                    icon: Icons.menu_book_rounded,
                    gradient: const [Color(0xFF11998e), Color(0xFF38ef7d)],
                    onTap: () => Navigator.pushNamed(context, '/reading'),
                  ),
                  const SizedBox(height: 16),
                  _buildEnhancedFeatureCard(
                    title: 'Quiz',
                    subtitle: 'Bilgini test et ve puanını artır',
                    icon: Icons.quiz_rounded,
                    gradient: const [Color(0xFFf093fb), Color(0xFFf5576c)],
                    onTap: () => Navigator.pushNamed(context, '/quiz'),
                  ),
                  const SizedBox(height: 16),
                  _buildEnhancedFeatureCard(
                    title: 'Gramer',
                    subtitle: 'Dil bilgisi kurallarını öğren',
                    icon: Icons.school_rounded,
                    gradient: const [Color(0xFF4facfe), Color(0xFF00f2fe)],
                    onTap: () => Navigator.pushNamed(context, '/grammar'),
                  ),
                ]),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/chatbot'),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFa8edea).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.psychology_alt_rounded,
                            color: Color(0xFF6A1B9A),
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Sorularını yanıtlamak için hazır',
                                style: TextStyle(
                                  color: const Color(0xFF2D3748).withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFF6A1B9A).withOpacity(0.8),
                            size: 16,
                          ),
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
    required String subtitle,
    required IconData icon,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: gradient.first.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}