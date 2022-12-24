import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext buildContext;
  const CustomHeader(this.buildContext);
  @override
  State<CustomHeader> createState() => _CustomHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(widget.buildContext);
          },
          child: Image.asset(
            'assets/images/back_btn.png',
            width: 40.0,
            height: 40.0,
          ),
        ),
      ),
    ]);
  }
}
