import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wordspark/screens/auth/login_screen.dart';
import 'package:wordspark/screens/auth/signup_screen.dart';
import 'package:wordspark/screens/controller_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_screen.dart';
import 'screens/flashcards_screen.dart';
import 'screens/reading_screen.dart';
import 'screens/grammar_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/chatbot_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(const MyApp(isAuthenticated: false));
    } else {
      runApp(const MyApp(isAuthenticated: true));
    }
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({super.key, required this.isAuthenticated});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WordSpark',
      initialRoute: isAuthenticated ? '/controller' : '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) =>  const RegisterScreen(),
        '/controller': (context) =>  const ControlScreen(),
        '/home': (context) => const HomeScreen(),
        '/flashcards': (context) => const FlashcardsScreen(),
        '/reading': (context) => ReadingScreen(),
        '/grammar': (context) => GrammarScreen(),
        '/quiz': (context) => QuizScreen(),
        '/chatbot': (context) => ChatbotScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}


