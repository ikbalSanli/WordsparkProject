import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'firebase_options.dart'; // firebase_options.dart dosyasını import et
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_screen.dart'; // HomeScreen widget'ını import et
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
  // Firebase'i başlatırken doğru yapılandırma dosyasını kullan
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase yapılandırmasını sağla
  );
  // Kullanıcı durumunu dinle
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(MyApp(isAuthenticated: false)); // Giriş yapmamışsa login ekranı
    } else {
      runApp(MyApp(isAuthenticated: true)); // Giriş yapmışsa home ekranı
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
      initialRoute: isAuthenticated ? '/home' : '/', // Kullanıcı durumuna göre yönlendirme
      routes: {
        '/': (context) => LoginScreen(),  // Giriş ekranı ana sayfa olarak
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(), // Kayıt ekranı
        '/home': (context) => HomeScreen(), // Add your home screen here
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


