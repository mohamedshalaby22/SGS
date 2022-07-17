import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String? user;
  String? msg;
  String? time;
  String? name;

  Chat(
      {required this.user,
      required this.msg,
      required this.time,
      required this.name});

  Chat.fromJson(QueryDocumentSnapshot<Object?> json) {
    user = json['user'];
    msg = json['msg'];
    time = json['time'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'user': user, 'msg': msg, 'time': time, 'name': name};
  }

  static bool isMyMessage(String remoteEmail, String localEmail) {
    if (remoteEmail == localEmail) return true;
    return false;
  }
}
