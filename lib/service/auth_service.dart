import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wordspark/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> registerUser({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        ...userModel.toJson(),
        'id': userCredential.user!.uid,
      });

      return userCredential;
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }
   Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Password reset failed: ${e.toString()}');
    }
  }
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        return doc.data();
      }
      return null;
    } catch (e) {
      throw Exception('Kullanıcı verisi alınırken hata oluştu');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}