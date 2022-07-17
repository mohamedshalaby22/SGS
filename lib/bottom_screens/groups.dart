import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Services/chat_service.dart';
import 'package:flutter_application_3/Screens/chats.dart';
import 'package:get/get.dart';

import '../components/text1.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  // String? msgCount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => const ThirdScreen(), transition: Transition.native);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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

                      if (chatList.isEmpty) {
                        return const Center(
                          child: Text('كل الجروبات سوف تظهر هنا'),
                        );
                      } else {
                        return ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.all(10),
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/p1.png'),
                          ),
                          title: const Text('SG Chat'),
                          trailing: CircleAvatar(
                              backgroundColor: Colors.green.shade500,
                              child: Text1(
                                text: chatList.length.toString(),
                                color: Colors.white,
                              )),
                        );
                      }
                    }
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                }),
          ),
        ));
  }
}
