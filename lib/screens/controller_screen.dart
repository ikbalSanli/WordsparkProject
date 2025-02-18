import 'package:flutter/material.dart';
import 'package:wordspark/components/bottom_navigator_button.dart';
import 'package:wordspark/screens/favorites_screen.dart';
import 'package:wordspark/screens/home_screen.dart';
import 'package:wordspark/screens/profile_screen.dart';
import 'package:wordspark/style/colors.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  final PageController _pageController = PageController();
  int index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: appcolor,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        children:  const [HomeScreen(), FavoritesScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomNavigatorButton(() {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }, index, 0, "Ana Sayfa", Icons.home),
                bottomNavigatorButton(() {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }, index, 1, "Favoriler", Icons.favorite),
                bottomNavigatorButton(() {
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }, index, 2, "Ayarlar", Icons.settings),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



