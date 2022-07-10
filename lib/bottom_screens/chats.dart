// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/chat_model.dart';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/chat_service.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/components/chats_bottom.dart';
import 'package:flutter_application_3/components/chats_message.dart';
import 'package:flutter_application_3/components/text1.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  UserModel? localUser;
  @override
  void initState() {
    initLocalUser(localUser);
    super.initState();
  }

  initLocalUser(UserModel? user) async {
    localUser = await SharedPrefrencesStorage.getSavedUser();
  }

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
            child: StreamBuilder<QuerySnapshot?>(
                stream: ChatService.instance
                    .getAllChats(ChatService.chatCollection),
                builder: (context, snapShot) {
                  if (snapShot.hasError || (!snapShot.hasData)) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  } else if (snapShot.hasData) {
                    if (snapShot.connectionState == ConnectionState.none) {
                      return const CircularProgressIndicator();
                    } else {
                      List<QueryDocumentSnapshot<Object?>> chatList =
                          snapShot.data!.docs.reversed.toList();

                      return chatList.isEmpty
                          ? const Center(
                              child: Text('كل الرسائل سوف تظهر هنا'),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              reverse: true,
                              itemCount: chatList.length,
                              itemBuilder: ((context, index) {
                                Chat currentMsg =
                                    Chat.fromJson(chatList[index]);

                                return ChatsMessage(
                                  isSended: Chat.isMyMessage(
                                      currentMsg.user!, localUser!.email!),
                                  text: currentMsg.msg!,
                                  time: currentMsg.time!,
                                );
                              }));
                    }
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: const BottomChatbar(),
    );
  }
}
