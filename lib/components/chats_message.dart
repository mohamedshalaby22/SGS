// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class ChatsMessage extends StatelessWidget {
  ChatsMessage({
    Key? key,
    required this.isSended,
    required this.text,
  }) : super(key: key);
  bool isSended;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      child: Column(
        crossAxisAlignment:
            isSended ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
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
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text1(
            text: "4:35 pm",
            size: 12,
          )
        ],
      ),
    );
  }
}
