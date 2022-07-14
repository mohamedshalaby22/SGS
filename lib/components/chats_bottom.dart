// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/chat_model.dart';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/chat_service.dart';

import '../Services/sharedprefrences.dart';

class BottomChatbar extends StatefulWidget {
  const BottomChatbar({
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
      padding: const EdgeInsets.only(bottom: 10, top: 10),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: GestureDetector(
                onTap: () async {
                  UserModel? user =
                      await SharedPrefrencesStorage.getSavedUser();
                  String time = TimeOfDay.fromDateTime(DateTime.now())
                      .format(context)
                      .toString();
                  String date = DateTime.now().toString();

                  ChatService.instance.createModelInDb(
                      date.toString(),
                      Chat(
                          user: user!.email,
                          msg: messageController.text,
                          time: time,
                          name: user.name),
                      ChatService.chatCollection);

                  messageController.clear();
                },
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
