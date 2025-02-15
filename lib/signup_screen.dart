import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kayıt olma işlemi
  Future<void> registerUser() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kayıt başarılı!")),
      );
      // Kullanıcı kaydolduktan sonra giriş ekranına yönlendir
      Navigator.pushReplacementNamed(context, "/");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kayıt hatası: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Ol")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // E-posta alanı
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "E-posta"),
              keyboardType: TextInputType.emailAddress,
            ),
            // Şifre alanı
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Şifre"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: Text("Kayıt Ol"),
            ),
            // Giriş ekranına yönlendiren buton
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Text("Zaten bir hesabınız var mı? Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
