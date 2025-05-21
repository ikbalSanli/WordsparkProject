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
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:wordspark/service/json_to_firestore.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'AIzaSyCmqHj8yoA2164dF_mJZ_i1eaLAYCC1haA');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    await FirestoreUploader().uploadFlashcardsFromJson('assets/data/flashcards.json');
  } catch (e) {
    print('Veri yükleme hatası: $e');
  }


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
        '/flashcards': (context) =>  const FlashcardsScreen(),
        '/reading': (context) => const ReadingScreen(),
        '/grammar': (context) => const GrammarScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/chatbot': (context) => const ChatbotScreen(),
        '/chat': (context) => const ChatScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

