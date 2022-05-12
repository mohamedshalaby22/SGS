// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('3',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
