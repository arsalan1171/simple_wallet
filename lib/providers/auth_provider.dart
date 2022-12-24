import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/firebase_instance.dart';

class AuthProvider with ChangeNotifier {
  // public variables
  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  AuthProvider.initialize() {
    _fireSetUp();
  }

  _fireSetUp() async {
    initializeFirebaseApp().then((value) => {auth.authStateChanges()});
  }

  Future<bool> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) async {
        await prefs.setString("customerId", value.user!.uid);
        prefs.setBool('customer_logged_in', true);
      });

      notifyListeners();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('customerId', " ");
    prefs.setBool('customer_logged_in', false);
    notifyListeners();
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }
}
