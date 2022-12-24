import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/auth_provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String customerName = "";

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(130.0, 0, 158, 35),
        child: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.01,
              color: Colors.deepPurple),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/profile_pic.png"),
            ),
          )),
      SizedBox(
        height: 20,
      ),
      Text(
        customerName,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.01,
            color: Colors.deepPurple),
        textAlign: TextAlign.center,
      ),
      IconButton(
        iconSize: 20,
        icon: const Icon(
          Icons.logout_rounded,
        ),
        onPressed: () {
          authProvider.signOut().then((value) =>
              {Navigator.of(context, rootNavigator: true).pop(context)});
        },
      ),
    ]);
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';

    setState(() {
      customerName = name;
    });
  }
}
