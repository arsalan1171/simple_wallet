import 'package:flutter/material.dart';
import 'package:simple_wallet/screens/inbox_screen/body.dart';

import '../header.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(context),
      body: Body(),
    );
  }
}
