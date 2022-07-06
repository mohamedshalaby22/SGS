// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/chat_data.dart';
import 'package:flutter_application_3/components/chats_bottom.dart';
import 'package:flutter_application_3/components/chats_message.dart';
import 'package:flutter_application_3/components/text1.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    Key? key,
  }) : super(key: key);

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
