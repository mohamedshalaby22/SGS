// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant/const.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    this.width = double.infinity,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  String text;
  double width;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          gradient: onPressed == null
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      secColor,
                      thiColor,
                    ])),
      child: TextButton(
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: wprimary,
              ))),
    );
  }
}
