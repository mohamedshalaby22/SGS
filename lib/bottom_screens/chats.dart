// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/chats_bottom.dart';
import 'package:flutter_application_3/components/chats_message.dart';
import 'package:flutter_application_3/components/text1.dart';

class Data {
  String text;
  bool isSender;
  Data({
    required this.text,
    required this.isSender,
  });
}

class ThirdScreen extends StatelessWidget {
  ThirdScreen({
    Key? key,
  }) : super(key: key);

  List sendData = [
    Data(text: 'First Message', isSender: true),
    Data(text: 'Second Message', isSender: false),
    Data(text: 'Ali Mohamed', isSender: true),
    Data(text: 'How Are You', isSender: true),
    Data(text: 'I\'m fine thank you', isSender: false),
    Data(text: 'First Message', isSender: false),
    Data(text: 'Second Message', isSender: false),
    Data(text: 'Ali Mohamed', isSender: true),
    Data(text: 'How Are You', isSender: true),
    Data(text: 'I\'m fine thank you', isSender: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/p1.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text: 'Dr: Doctor1',
                  color: Colors.grey.shade500,
                ),
                Text1(
                  text: 'Online',
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: sendData.length,
                itemBuilder: ((context, index) => ChatsMessage(
                      isSended: sendData[index].isSender,
                      text: sendData[index].text,
                    ))),
          )
        ],
      ),
      bottomNavigationBar: const BottomChatbar(),
    );
  }
}
