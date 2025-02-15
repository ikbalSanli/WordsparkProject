import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'firebase_options.dart'; // firebase_options.dart dosyasını import et
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'signup_screen.dart';  // RegisterScreen'i import et



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
        '/': (context) => LoginScreen(),  // LoginScreen yönlendirmesi
        '/home': (context) => HomeScreen(),  // HomeScreen yönlendirmesi
        '/register': (context) => RegisterScreen(),  // Kayıt ekranı
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa")),
      body: Center(child: Text("Giriş Başarılı!")),
    );
  }
}
