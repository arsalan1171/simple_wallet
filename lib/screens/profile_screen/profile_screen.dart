import 'package:flutter/material.dart';
import 'package:simple_wallet/screens/profile_screen/body.dart';

import '../header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context),
      body: Body(),
    );
  }
}
