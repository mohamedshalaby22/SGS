import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/alerts.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://radiant-falls-92419.herokuapp.com';

  static Future<Map<String, String>> _getHeaders() async {
    final token = await SharedPrefrencesStorage.getSavedToken();
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }

  static Future<Map> loginStudent(
    String email,
    String password, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(
          Uri.parse(
              _baseUrl + '/api/student/login?email=$email&password=$password'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        String token = parsed['data']['token'];
        await SharedPrefrencesStorage.saveToken(token);
        final user = UserModel.fromJson(parsed['data']);
        await SharedPrefrencesStorage.saveUser(jsonEncode(user.toJson()));
        Get.offAll(() => const HomeLayOut());
        return {};
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> uploadStudentPhoto(
    File image, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();

      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        Uri.parse(_baseUrl + '/api/student/update-picture'),
      );

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('photo', image.path);

      request.files.add(multipartFile);
      request.headers.addAll(await _getHeaders());

      final responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> changeStudentPassword(String newPassword,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await put(
          Uri.parse(
              _baseUrl + '/api/student/change-password?password=$newPassword'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> logout({bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(Uri.parse(_baseUrl + '/api/student/logout'),
          encoding: Encoding.getByName('utf-8'), headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> deleteProfileImage({bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await delete(
          Uri.parse(_baseUrl + '/api/student/delete-picture'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> getProfile(String newPassword,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await get(Uri.parse(_baseUrl + '/api/student/profile'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }
}
