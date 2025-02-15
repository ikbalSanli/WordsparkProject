import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Çıkış yapma fonksiyonu
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Çıkış yaptıktan sonra LoginScreen'e yönlendir
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Giriş Başarılı!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => signOut(context),
              child: Text("Çıkış Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
