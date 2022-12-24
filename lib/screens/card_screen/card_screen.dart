import 'package:flutter/material.dart';
import 'package:simple_wallet/screens/card_screen/body.dart';
import 'package:simple_wallet/screens/header.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context),
      body: Body(),
    );
  }
}
