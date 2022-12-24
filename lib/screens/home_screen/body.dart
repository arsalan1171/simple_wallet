import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_wallet/screens/card_screen/card_screen.dart';
import 'package:simple_wallet/screens/inbox_screen/inbox_screen.dart';

import '../../helpers/constants.dart';
import '../profile_screen/profile_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _transactions = [];

  @override
  void initState() {
    readTransactionsFromFile();
    super.initState();
  }

  Future<void> readTransactionsFromFile() async {
    final String response =
        await rootBundle.loadString('assets/transactions.json');
    final data = await json.decode(response);
    setState(() {
      _transactions = data["transactions"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 69, 28, 35),
          child: Row(
            children: [
              Column(
                children: const [
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      letterSpacing: 0.01,
                      color: kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Active",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      letterSpacing: 0.01,
                      color: Color(0x82828282),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(),
              Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/images/profile_pic.png"),
                    ),
                  )),
            ],
          ),
        ),
        Container(
          width: 335.0,
          height: 140.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/info_section.png"),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardScreen()),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InboxScreen()),
                  );
                },
                child: Image.asset(
                  'assets/images/inbox_icon.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: Image.asset(
                  'assets/images/profile_icon.png',
                  width: 100.0,
                  height: 100.0,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Recent Transactions",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            letterSpacing: 0.01,
            color: kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        _transactions.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(6),
                      shadowColor: Colors.black,
                      child: SingleChildScrollView(
                        child: ListTile(
                          title: Row(children: [
                            Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage("assets/images/" +
                                        _transactions[index]
                                            ["transaction_logo"]),
                                  ),
                                )),
                            SizedBox(
                              width: 22,
                            ),
                            Column(
                              children: [
                                Text(
                                  _transactions[index]["transaction_title"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                      fontFamily: "Quicksand"),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(_transactions[index]["transaction_amount"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.deepPurple,
                                    fontFamily: "Quicksand")),
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Text('No Transactions')
      ],
    )));
  }
}
