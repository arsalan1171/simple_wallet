import 'package:flutter/material.dart';
import 'package:simple_wallet/helpers/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(136, 0, 135, 50),
          child: Text(
            "My Card",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(kSecondaryColor),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 77),
          child: Container(
              width: 335.0,
              height: 220.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/Card.png"),
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.005,
                      color: Color(0xBDBDBDBD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 43,
                  ),
                  Text(
                    "Jason Momoa jr.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Bank",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.005,
                      color: Color(0xBDBDBDBD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 52,
                  ),
                  Text(
                    "Simple Wallet",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Account",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.005,
                      color: Color(0xBDBDBDBD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    "*** *** *** 2138",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.005,
                      color: Color(0xBDBDBDBD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 42,
                  ),
                  Text(
                    "Active",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Expiry",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.005,
                      color: Color(0xBDBDBDBD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 45.5,
                  ),
                  Text(
                    "04/25",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    ));
  }
}
