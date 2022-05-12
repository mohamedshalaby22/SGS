// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  Text1({
    Key? key,
    required this.text,
    this.size = 15,
    this.color = const Color(0xffBDBDBD),
  }) : super(key: key);
  String text;
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
    );
  }
}
