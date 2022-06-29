// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:flutter_application_3/bottom_screens/third.dart';
import 'package:get/get.dart';

class BottomChatbar extends StatefulWidget {
  BottomChatbar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomChatbar> createState() => _BottomChatbarState();
}

class _BottomChatbarState extends State<BottomChatbar> {
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: BottomAppBar(
        color: Colors.white,
        elevation: 0.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/p1.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: messageController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Type message'),
                      ),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue.shade400,
                  child: const Center(
                    child: Icon(
                      Icons.send_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
