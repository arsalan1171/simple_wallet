import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _messages = [];

  @override
  void initState() {
    readMessagesFromFile();
    super.initState();
  }

  Future<void> readMessagesFromFile() async {
    final String response = await rootBundle.loadString('assets/messages.json');
    final data = await json.decode(response);
    setState(() {
      _messages = data["messages"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(136, 30, 135, 40),
        child: Text(
          "Inbox",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.01,
              color: Colors.deepPurple),
          textAlign: TextAlign.center,
        ),
      ),
      _messages.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(const Radius.circular(15.0)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text(
                        _messages[index]["date_created"],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Color(0x82828282),
                            fontFamily: "Quicksand"),
                      ),
                      subtitle: Text(_messages[index]["msg_contents"],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey[600],
                              fontFamily: "Quicksand")),
                    ),
                  );
                },
              ),
            )
          : Text('No Messages')
    ])));
  }
}
