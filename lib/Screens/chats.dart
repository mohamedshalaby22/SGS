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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/p1.png'),
                  ),
                  Text1(
                    text: 'SG Chat',
                    color: Colors.green,
                    size: 17,
                  ),
                  Text1(
                    text: 'SG Chat',
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
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
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapShot.hasData) {
                      if (snapShot.connectionState == ConnectionState.none) {
                        return const CircularProgressIndicator();
                      } else {
                        List<QueryDocumentSnapshot<Object?>> chatList =
                            snapShot.data!.docs.reversed.toList();

                        return chatList.isEmpty
                            ? Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text1(
                                    text: 'no messages found',
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ))
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
                                      userName: currentMsg.name!);
                                }));
                      }
                    }

                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  }),
            ),
            const BottomChatbar(),
          ],
        ),
      ),
    );
  }
}
