import 'package:flutter/material.dart';
import 'package:simple_wallet/helpers/constants.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(106.0, 97.0, 107.0, 25.0),
        child: Container(
            width: 162.0,
            height: 164.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/main_logo.png"),
              ),
            )),
      ),
      Text(
        "Welcome Back!",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 0.01,
            color: kPrimaryColor),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 55,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(const Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: authProvider.email,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  icon: Icon(Icons.person)),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(const Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: authProvider.password,
              obscureText: _isObscure,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  icon: Icon(Icons.lock_open),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure == true
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 116,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: () async {
            if (!await authProvider.signIn()) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Login failed!")));
              return;
            }

            authProvider.clearController();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 133,
      ),
    ])));
  }
}
