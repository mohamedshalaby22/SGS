// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('2',style: TextStyle(color: Colors.black,)),
      ),
    );
  }
}
