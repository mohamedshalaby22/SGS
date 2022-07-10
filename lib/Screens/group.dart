// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/Services/chat_service.dart';

// import 'package:flutter_application_3/bottom_screens/chats.dart';

// class Groups extends StatelessWidget {
//   const Groups({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => const ThirdScreen(),
//           ));
//         },
//         child: Center(
//             child: StreamBuilder<QuerySnapshot?>(
//                 stream: ChatService.instance
//                     .getAllChats(ChatService.chatCollection),
//                 builder: (context, snapShot) {
//                   if (snapShot.hasError || (!snapShot.hasData)) {
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.black,
//                       ),
//                     );
//                   } else if (snapShot.hasData) {
//                     if (snapShot.connectionState == ConnectionState.none) {
//                       return const CircularProgressIndicator();
//                     } else {
//                       List<QueryDocumentSnapshot<Object?>> chatList =
//                           snapShot.data!.docs.reversed.toList();

//                       return chatList.isEmpty
//                           ? const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: ListTile(
//                                 tileColor: Colors.tealAccent,
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 40),
//                                 leading: Icon(
//                                   Icons.heart_broken,
//                                   color: Colors.red,
//                                 ),
//                                 title: Text('IT Group'),
//                                 trailing: Text('0'),
//                               ),
//                             )
//                           : Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: ListTile(
//                                 tileColor: Colors.tealAccent,
//                                 contentPadding:
//                                     const EdgeInsets.symmetric(horizontal: 40),
//                                 leading: const Icon(
//                                   Icons.heart_broken,
//                                   color: Colors.red,
//                                 ),
//                                 title: const Text('IT Group'),
//                                 trailing: Text(chatList.length.toString()),
//                               ),
//                             );
//                     }
//                   }

//                   return const Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Colors.black,
//                     ),
//                   );
//                 })));
//   }
// }
