// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class ChatsMessage extends StatelessWidget {
  ChatsMessage({
    Key? key,
    required this.time,
    required this.isSended,
    required this.text,
    required this.userName,
  }) : super(key: key);
  bool isSended;
  String text;
  String time;
  String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      child: Column(
        crossAxisAlignment:
            isSended ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              userName,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: isSended
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            secColor,
                            thiColor,
                          ])
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey.shade400, Colors.grey.shade500]),
                borderRadius: isSended
                    ? const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
            child: Column(
              crossAxisAlignment:
                  isSended ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text1(
            text: time,
            size: 12,
          )
        ],
      ),
    );
  }
}
