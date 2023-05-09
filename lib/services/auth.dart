import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  //Anonymous sign in
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print('anon login!');
    } on FirebaseAuthException catch (e) {
      //handle error
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('Signed Out!');
    } on FirebaseAuthException catch (e) {
      //handle error
    }
  }
}
