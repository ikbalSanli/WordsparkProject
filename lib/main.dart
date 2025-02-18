import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_screen.dart';
import 'auth/signup_screen.dart';
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
      runApp(MyApp(isAuthenticated: false));
    } else {
      runApp(MyApp(isAuthenticated: true));
    }
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WordSpark',
      initialRoute: isAuthenticated ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/flashcards': (context) => FlashcardsScreen(),
        '/reading': (context) => ReadingScreen(),
        '/grammar': (context) => GrammarScreen(),
        '/quiz': (context) => QuizScreen(),
        '/chatbot': (context) => ChatbotScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}


