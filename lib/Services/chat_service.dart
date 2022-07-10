import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatService {
  static ChatService instance = ChatService();
  late FirebaseFirestore _db;

  static String chatCollection = "chats";

  ChatService() {
    _db = FirebaseFirestore.instance;
  }

  Future<void> createModelInDb(String random, var model, String table) async {
    try {
      return await _db.collection(table).doc(random).set(model.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Stream<QuerySnapshot>? getAllChats(String table) {
    try {
      return _db.collection(table).snapshots();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
