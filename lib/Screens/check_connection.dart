import 'package:flutter/material.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/10_Connection Lost.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
