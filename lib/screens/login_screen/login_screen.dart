import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_wallet/screens/login_screen/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
