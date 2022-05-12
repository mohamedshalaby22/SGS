import 'dart:convert';

import 'package:flutter_application_3/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesStorage {
  static SharedPreferences? _prefs;
  static const String savedTokenKey = 'TOKEN';
  static const String savedUserKey = 'USER';
  static const String savedIsFirstKey = 'ISFIRST';

  static Future<void> _getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static saveToken(String token) async {
    await _getInstance();
    await _prefs!.setString(savedTokenKey, token);
  }

  static Future<String> getSavedToken() async {
    await _getInstance();
    return _prefs!.getString(savedTokenKey) ?? '';
  }

  static saveUser(String user) async {
    await _getInstance();
    await _prefs!.setString(savedUserKey, user);
  }

  static Future<UserModel?> getSavedUser() async {
    await _getInstance();
    final result = _prefs!.getString(savedUserKey) ?? '';
    if (result.isNotEmpty) {
      final user = UserModel.fromJson(jsonDecode(result));
      return user;
    }
    return null;
  }

  static saveIsFirst(bool isFirst) async {
    await _getInstance();
    await _prefs!.setBool(savedIsFirstKey, isFirst);
  }

  static Future<bool> getIsFirst() async {
    await _getInstance();
    return _prefs!.getBool(savedIsFirstKey) ?? true;
  }
}
