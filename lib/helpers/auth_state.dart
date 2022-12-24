import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_wallet/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/firebase_instance.dart';
import '../screens/login_screen/login_screen.dart';

class AuthStateBuilder extends StatelessWidget {
  const AuthStateBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          }
          return FutureBuilder<DocumentSnapshot>(
              future: firebaseFirestore
                  .collection('customers')
                  .doc(snapshot.data?.uid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  DocumentSnapshot ds = snapshot.data!;
                  String? name = (ds.data() as dynamic)['name'];
                  setName(name);
                  return HomeScreen();
                }

                return LoginScreen();
              });
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

setName(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
}
